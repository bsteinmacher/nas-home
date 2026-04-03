import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/lidarr.dart';
import '../../domain/usecases/lidarr_usecases.dart';

part 'lidarr_bloc.freezed.dart';

@freezed
class LidarrEvent with _$LidarrEvent {
  const factory LidarrEvent.searchRequested(String query) = SearchRequested;
  const factory LidarrEvent.artistRequested(LidarrArtist artist) = ArtistRequested;
  const factory LidarrEvent.albumsRequested(String artistId) = AlbumsRequested;
}

@freezed
class LidarrState with _$LidarrState {
  const factory LidarrState.initial() = LidarrInitial;
  const factory LidarrState.loading() = LidarrLoading;
  const factory LidarrState.artistsLoaded(List<LidarrArtist> artists) = ArtistsLoaded;
  const factory LidarrState.albumsLoaded(List<LidarrAlbum> albums) = AlbumsLoaded;
  const factory LidarrState.error(String message) = LidarrError;
  const factory LidarrState.success(String message) = LidarrSuccess;
}

class LidarrBloc extends Bloc<LidarrEvent, LidarrState> {
  final SearchArtistsUseCase searchArtists;
  final RequestArtistUseCase requestArtist;
  final GetAlbumsUseCase getAlbums;

  LidarrBloc({
    required this.searchArtists,
    required this.requestArtist,
    required this.getAlbums,
  }) : super(const LidarrInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<ArtistRequested>(_onArtistRequested);
    on<AlbumsRequested>(_onAlbumsRequested);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<LidarrState> emit) async {
    final trimmedQuery = event.query.trim();
    if (trimmedQuery.isEmpty) return;
    
    emit(const LidarrLoading());
    try {
      final artists = await searchArtists.execute(trimmedQuery);
      emit(ArtistsLoaded(artists));
    } catch (e) {
      emit(LidarrError(e.toString()));
    }
  }

  Future<void> _onArtistRequested(ArtistRequested event, Emitter<LidarrState> emit) async {
    final currentState = state;
    try {
      await requestArtist.execute(event.artist);
      emit(const LidarrSuccess('Artist added successfully!'));
      
      // Update the artist status in the list if we are in ArtistsLoaded state
      if (currentState is ArtistsLoaded) {
        final updatedArtists = currentState.artists.map((a) {
          if (a.mbid == event.artist.mbid) {
            return a.copyWith(isAdded: true, status: 'Added');
          }
          return a;
        }).toList();
        emit(ArtistsLoaded(updatedArtists));
      }
    } catch (e) {
      emit(LidarrError(e.toString()));
      if (currentState is ArtistsLoaded) {
        emit(currentState);
      }
    }
  }

  Future<void> _onAlbumsRequested(AlbumsRequested event, Emitter<LidarrState> emit) async {
    emit(const LidarrLoading());
    try {
      final albums = await getAlbums.execute(event.artistId);
      emit(AlbumsLoaded(albums));
    } catch (e) {
      emit(LidarrError(e.toString()));
    }
  }
}
