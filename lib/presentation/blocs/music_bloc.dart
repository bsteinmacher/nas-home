import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/music.dart';
import '../../domain/usecases/music_usecases.dart';

part 'music_bloc.freezed.dart';

@freezed
class MusicEvent with _$MusicEvent {
  const factory MusicEvent.artistsRequested() = ArtistsRequested;
  const factory MusicEvent.albumsRequested(String artistId) = AlbumsRequested;
}

@freezed
class MusicState with _$MusicState {
  const factory MusicState.initial() = MusicInitial;
  const factory MusicState.loading() = MusicLoading;
  const factory MusicState.artistsLoaded(List<Artist> artists) = ArtistsLoaded;
  const factory MusicState.albumsLoaded(List<Album> albums) = AlbumsLoaded;
  const factory MusicState.error(String message) = MusicError;
}

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetArtistsUseCase getArtists;
  final GetAlbumsUseCase getAlbums;

  MusicBloc({
    required this.getArtists,
    required this.getAlbums,
  }) : super(const MusicInitial()) {
    on<ArtistsRequested>(_onArtistsRequested);
    on<AlbumsRequested>(_onAlbumsRequested);
  }

  Future<void> _onArtistsRequested(ArtistsRequested event, Emitter<MusicState> emit) async {
    emit(const MusicLoading());
    try {
      final artists = await getArtists.execute();
      emit(ArtistsLoaded(artists));
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
