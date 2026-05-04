import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/radarr.dart';
import '../../domain/usecases/radarr_usecases.dart';

part 'radarr_bloc.freezed.dart';

@freezed
class RadarrEvent with _$RadarrEvent {
  const factory RadarrEvent.fetchMovies() = FetchMovies;
  const factory RadarrEvent.refreshQueue() = RefreshQueue;
}

@freezed
class RadarrState with _$RadarrState {
  const factory RadarrState.initial() = RadarrInitial;
  const factory RadarrState.loading() = RadarrLoading;
  const factory RadarrState.loaded({
    required List<RadarrMovie> movies,
    required List<dynamic> queue,
  }) = RadarrLoaded;
  const factory RadarrState.error(String message) = RadarrError;
}

class RadarrBloc extends Bloc<RadarrEvent, RadarrState> {
  final GetRadarrMoviesUseCase getMovies;
  final GetRadarrQueueUseCase getQueue;

  RadarrBloc({
    required this.getMovies,
    required this.getQueue,
  }) : super(const RadarrInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<RefreshQueue>(_onRefreshQueue);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<RadarrState> emit) async {
    emit(const RadarrLoading());
    try {
      final movies = await getMovies.execute();
      final queue = await getQueue.execute();
      emit(RadarrLoaded(movies: movies, queue: queue));
    } catch (e) {
      emit(RadarrError(e.toString()));
    }
  }

  Future<void> _onRefreshQueue(RefreshQueue event, Emitter<RadarrState> emit) async {
    final currentState = state;
    if (currentState is RadarrLoaded) {
      try {
        final queue = await getQueue.execute();
        emit(currentState.copyWith(queue: queue));
      } catch (e) {
        // Keep the movies list even if queue refresh fails
      }
    } else {
      add(const FetchMovies());
    }
  }
}
