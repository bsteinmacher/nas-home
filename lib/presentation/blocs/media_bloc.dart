import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/media.dart';
import '../../domain/usecases/seerr_usecases.dart';

part 'media_bloc.freezed.dart';

@freezed
class MediaEvent with _$MediaEvent {
  const factory MediaEvent.searchRequested(String query) = SearchRequested;
  const factory MediaEvent.trendingRequested() = TrendingRequested;
  const factory MediaEvent.mediaRequested(int mediaId, String mediaType) = RequestMedia;
}

@freezed
class MediaState with _$MediaState {
  const factory MediaState.initial() = MediaInitial;
  const factory MediaState.loading() = MediaLoading;
  const factory MediaState.loaded(List<Media> mediaList) = MediaLoaded;
  const factory MediaState.error(String message) = MediaError;
  const factory MediaState.requestSuccess() = RequestSuccess;
}

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final SearchMediaUseCase searchMedia;
  final GetTrendingMediaUseCase getTrendingMedia;
  final RequestMediaUseCase requestMedia;

  MediaBloc({
    required this.searchMedia,
    required this.getTrendingMedia,
    required this.requestMedia,
  }) : super(const MediaInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<TrendingRequested>(_onTrendingRequested);
    on<RequestMedia>(_onRequestMedia);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<MediaState> emit) async {
    emit(const MediaLoading());
    try {
      final results = await searchMedia.execute(event.query);
      emit(MediaLoaded(results));
    } catch (e) {
      emit(MediaError(e.toString()));
    }
  }

  Future<void> _onTrendingRequested(TrendingRequested event, Emitter<MediaState> emit) async {
    emit(const MediaLoading());
    try {
      final results = await getTrendingMedia.execute();
      emit(MediaLoaded(results));
    } catch (e) {
      emit(MediaError(e.toString()));
    }
  }

  Future<void> _onRequestMedia(RequestMedia event, Emitter<MediaState> emit) async {
    // We don't want to lose the current list while requesting
    final currentState = state;
    try {
      await requestMedia.execute(event.mediaId, event.mediaType);
      emit(const RequestSuccess());
      // Re-emit loaded state if we were in it
      if (currentState is MediaLoaded) {
        emit(currentState);
      }
    } catch (e) {
      emit(MediaError(e.toString()));
      if (currentState is MediaLoaded) {
        emit(currentState);
      }
    }
  }
}
