import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nas_home/data/datasources/lidarr_datasource.dart';
import 'package:nas_home/domain/entities/lidarr.dart';
import 'package:nas_home/domain/repositories/lidarr_repository.dart';
import 'package:nas_home/domain/usecases/lidarr_usecases.dart';
import 'package:nas_home/presentation/blocs/lidarr_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('álbum diferencia busca em andamento de download na fila', () {
    const searching = LidarrAlbum(
      id: '10',
      title: 'Album',
      artistName: 'Artist',
      releaseDate: null,
      remoteCover: null,
      isInLibrary: true,
      isSearching: true,
    );
    const downloading = LidarrAlbum(
      id: '10',
      title: 'Album',
      artistName: 'Artist',
      releaseDate: null,
      remoteCover: null,
      isInLibrary: true,
      isQueued: true,
      isSearching: true,
    );

    expect(searching.actionLabel, 'SEARCHING');
    expect(searching.isActionEnabled, isFalse);
    expect(downloading.actionLabel, 'DOWNLOADING');
  });

  test(
    'falha do comando limpa busca persistida e informa a interface',
    () async {
      SharedPreferences.setMockInitialValues({});
      final preferences = await SharedPreferences.getInstance();
      final repository = _FakeLidarrRepository();
      final bloc = _createBloc(repository, preferences);
      final failedUpdate = bloc.stream.firstWhere(
        (state) => state.maybeWhen(
          searchUpdated: (_, status, _) => status == 'failed',
          orElse: () => false,
        ),
      );

      await bloc.triggerAlbumSearch('10');
      final state = await failedUpdate.timeout(const Duration(seconds: 2));

      expect(
        state.maybeWhen(
          searchUpdated: (_, _, message) => message,
          orElse: () => '',
        ),
        'Indexer indisponível',
      );
      expect(bloc.pendingSearchAlbumIds, isEmpty);
      expect(preferences.getString('lidarr_pending_searches_v1'), '[]');

      await bloc.close();
    },
  );

  test('carrega discografia externa pelo MusicBrainz Artist ID', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final adapter = _MusicBrainzAdapter();
    final dio = Dio()..httpClientAdapter = adapter;
    final dataSource = LidarrDataSourceImpl(
      dio: dio,
      sharedPreferences: preferences,
    );

    final albums = await dataSource.lookupAlbums(
      'foo-fighters-mbid',
      'Foo Fighters',
    );

    expect(
      adapter.request?.path,
      'https://musicbrainz.org/ws/2/release-group',
    );
    expect(adapter.request?.queryParameters['artist'], 'foo-fighters-mbid');
    expect(albums.map((album) => album.title), ['Recent Album', 'Old Album']);
    expect(albums.first.id, 'release-group-2');
    expect(albums.first.isInLibrary, isFalse);
    expect(
      albums.first.remoteCover,
      'https://coverartarchive.org/release-group/release-group-2/front-500',
    );
  });
}

LidarrBloc _createBloc(
  LidarrRepository repository,
  SharedPreferences preferences,
) {
  return LidarrBloc(
    searchArtists: SearchArtistsUseCase(repository),
    getLibraryArtists: GetLibraryArtistsUseCase(repository),
    requestArtist: RequestArtistUseCase(repository),
    getAlbums: GetAlbumsUseCase(repository),
    getAlbum: GetAlbumUseCase(repository),
    lookupAlbums: LookupAlbumsUseCase(repository),
    getTracks: GetTracksUseCase(repository),
    searchAlbum: SearchAlbumUseCase(repository),
    searchArtistDiscography: SearchArtistDiscographyUseCase(repository),
    getCommandStatus: GetLidarrCommandStatusUseCase(repository),
    sharedPreferences: preferences,
  );
}

class _FakeLidarrRepository implements LidarrRepository {
  @override
  Future<LidarrCommand> searchAlbum(String albumId) async {
    return const LidarrCommand(id: '99', status: 'queued');
  }

  @override
  Future<LidarrCommand> getCommandStatus(String commandId) async {
    return const LidarrCommand(
      id: '99',
      status: 'failed',
      message: 'Indexer indisponível',
    );
  }

  @override
  Future<LidarrAlbum> getAlbum(String albumId) async {
    return LidarrAlbum(
      id: albumId,
      title: 'Album',
      artistName: 'Artist',
      releaseDate: null,
      remoteCover: null,
      isInLibrary: true,
    );
  }

  @override
  Future<List<LidarrAlbum>> getAlbums(String artistId) async => [];

  @override
  Future<List<LidarrArtist>> getLibraryArtists() async => [];

  @override
  Future<List<LidarrTrack>> getTracks(
    String albumId, {
    bool isQueued = false,
  }) async => [];

  @override
  Future<List<LidarrAlbum>> lookupAlbums(
    String artistMbid,
    String artistName,
  ) async => [];

  @override
  Future<LidarrArtist> requestArtist(LidarrArtist artist) async => artist;

  @override
  Future<LidarrCommand> searchArtistDiscography(String artistId) async {
    return const LidarrCommand(id: '100', status: 'queued');
  }

  @override
  Future<List<LidarrArtist>> searchArtists(String query) async => [];
}

class _MusicBrainzAdapter implements HttpClientAdapter {
  RequestOptions? request;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      jsonEncode({
        'release-groups': [
          {
            'id': 'release-group-1',
            'title': 'Old Album',
            'first-release-date': '1995-01-01',
          },
          {
            'id': 'release-group-2',
            'title': 'Recent Album',
            'first-release-date': '2023-06-02',
          },
        ],
      }),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
