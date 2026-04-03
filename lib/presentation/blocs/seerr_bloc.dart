import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seerr.dart';
import '../../domain/usecases/seerr_usecases.dart';

part 'seerr_bloc.freezed.dart';

@freezed
class SeerrEvent with _$SeerrEvent {
  const factory SeerrEvent.searchRequested(String query) = SearchRequested;
  const factory SeerrEvent.trendingRequested() = TrendingRequested;
  const factory SeerrEvent.mediaRequested(int mediaId, String mediaType) = RequestSeerr;
}

@freezed
class SeerrState with _$SeerrState {
  const factory SeerrState.initial() = SeerrInitial;
  const factory SeerrState.loading() = SeerrLoading;
  const factory SeerrState.loaded(List<Seerr> seerrList) = SeerrLoaded;
  const factory SeerrState.error(String message) = SeerrError;
  const factory SeerrState.requestSuccess() = RequestSuccess;
}

class SeerrBloc extends Bloc<SeerrEvent, SeerrState> {
  final SearchSeerrUseCase searchSeerr;
  final GetTrendingSeerrUseCase getTrendingSeerr;
  final RequestSeerrUseCase requestSeerr;

  SeerrBloc({
    required this.searchSeerr,
    required this.getTrendingSeerr,
    required this.requestSeerr,
  }) : super(const SeerrInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<TrendingRequested>(_onTrendingRequested);
    on<RequestSeerr>(_onRequestSeerr);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<SeerrState> emit) async {
    emit(const SeerrLoading());
    try {
      final results = await searchSeerr.execute(event.query);
      emit(SeerrLoaded(results));
    } catch (e) {
      emit(SeerrError(e.toString()));
    }
  }

  Future<void> _onTrendingRequested(TrendingRequested event, Emitter<SeerrState> emit) async {
    emit(const SeerrLoading());
    try {
      final results = await getTrendingSeerr.execute();
      emit(SeerrLoaded(results));
    } catch (e) {
      emit(SeerrError(e.toString()));
    }
  }

  Future<void> _onRequestSeerr(RequestSeerr event, Emitter<SeerrState> emit) async {
    final currentState = state;
    if (currentState is SeerrLoaded) {
      try {
        await requestSeerr.execute(event.mediaId, event.mediaType);
        
        // Update the item in the current list
        final updatedList = currentState.seerrList.map((item) {
          if (item.id == event.mediaId) {
            return item.copyWith(
              isRequested: true,
              status: 2, // Pending
            );
          }
          return item;
        }).toList();

        emit(const RequestSuccess());
        emit(SeerrLoaded(updatedList));
      } catch (e) {
        emit(SeerrError(e.toString()));
        emit(currentState);
      }
    } else {
      try {
        await requestSeerr.execute(event.mediaId, event.mediaType);
        emit(const RequestSuccess());
      } catch (e) {
        emit(SeerrError(e.toString()));
      }
    }
  }
}
