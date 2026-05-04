import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sonarr.dart';
import '../../domain/usecases/sonarr_usecases.dart';

part 'sonarr_bloc.freezed.dart';

@freezed
class SonarrEvent with _$SonarrEvent {
  const factory SonarrEvent.fetchSeries() = FetchSeries;
  const factory SonarrEvent.refreshQueue() = RefreshQueue;
}

@freezed
class SonarrState with _$SonarrState {
  const factory SonarrState.initial() = SonarrInitial;
  const factory SonarrState.loading() = SonarrLoading;
  const factory SonarrState.loaded({
    required List<SonarrSeries> series,
    required List<dynamic> queue,
  }) = SonarrLoaded;
  const factory SonarrState.error(String message) = SonarrError;
}

class SonarrBloc extends Bloc<SonarrEvent, SonarrState> {
  final GetSonarrSeriesUseCase getSeries;
  final GetSonarrQueueUseCase getQueue;

  SonarrBloc({
    required this.getSeries,
    required this.getQueue,
  }) : super(const SonarrInitial()) {
    on<FetchSeries>(_onFetchSeries);
    on<RefreshQueue>(_onRefreshQueue);
  }

  Future<void> _onFetchSeries(FetchSeries event, Emitter<SonarrState> emit) async {
    emit(const SonarrLoading());
    try {
      final series = await getSeries.execute();
      final queue = await getQueue.execute();
      emit(SonarrLoaded(series: series, queue: queue));
    } catch (e) {
      emit(SonarrError(e.toString()));
    }
  }

  Future<void> _onRefreshQueue(RefreshQueue event, Emitter<SonarrState> emit) async {
    final currentState = state;
    if (currentState is SonarrLoaded) {
      try {
        final queue = await getQueue.execute();
        emit(currentState.copyWith(queue: queue));
      } catch (e) {
        // Keep the series list even if queue refresh fails
      }
    } else {
      add(const FetchSeries());
    }
  }
}
