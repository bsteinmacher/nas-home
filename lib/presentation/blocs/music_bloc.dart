import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/music.dart';
import '../../domain/usecases/music_usecases.dart';

part 'music_bloc.freezed.dart';

@freezed
class MusicEvent with _$MusicEvent {
  const factory MusicEvent.searchRequested(String query) = SearchRequested;
  const factory MusicEvent.artistRequested(Artist artist) = ArtistRequested;
  const factory MusicEvent.albumsRequested(String artistId) = AlbumsRequested;
}

@freezed
class MusicState with _$MusicState {
  const factory MusicState.initial() = MusicInitial;
  const factory MusicState.loading() = MusicLoading;
  const factory MusicState.artistsLoaded(List<Artist> artists) = ArtistsLoaded;
  const factory MusicState.albumsLoaded(List<Album> albums) = AlbumsLoaded;
  const factory MusicState.success(String message) = MusicSuccess;
  const factory MusicState.error(String message) = MusicError;
}

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final SearchArtistsUseCase searchArtists;
  final RequestArtistUseCase requestArtist;
  final GetAlbumsUseCase getAlbums;

  MusicBloc({
    required this.searchArtists,
    required this.requestArtist,
    required this.getAlbums,
  }) : super(const MusicInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<ArtistRequested>(_onArtistRequested);
    on<AlbumsRequested>(_onAlbumsRequested);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<MusicState> emit) async {
    if (event.query.isEmpty) return;
    emit(const MusicLoading());
    try {
      final artists = await searchArtists.execute(event.query);
      emit(ArtistsLoaded(artists));
    } catch (e) {
      emit(MusicError(e.toString()));
    }
  }

  Future<void> _onArtistRequested(ArtistRequested event, Emitter<MusicState> emit) async {
    emit(const MusicLoading());
    try {
      await requestArtist.execute(event.artist);
      emit(const MusicSuccess('Artista adicionado com sucesso!'));
      // Opcional: Recarregar a busca para mostrar o status atualizado
    } catch (e) {
      emit(MusicError(e.toString()));
    }
  }

  Future<void> _onAlbumsRequested(AlbumsRequested event, Emitter<MusicState> emit) async {
    emit(const MusicLoading());
    try {
      final albums = await getAlbums.execute(event.artistId);
      emit(AlbumsLoaded(albums));
    } catch (e) {
      emit(MusicError(e.toString()));
    }
  }
}
