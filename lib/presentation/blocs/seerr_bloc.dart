import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seerr.dart';
import '../../domain/usecases/seerr_usecases.dart';

part 'seerr_bloc.freezed.dart';

@freezed
class SeerrEvent with _$SeerrEvent {
  const factory SeerrEvent.searchRequested(String query) = SearchRequested;
  const factory SeerrEvent.trendingRequested() = TrendingRequested;
  const factory SeerrEvent.detailsRequested(int mediaId, String mediaType) = DetailsRequested;
  const factory SeerrEvent.mediaRequested(int mediaId, String mediaType, {List<int>? seasons}) = RequestSeerr;
}

@freezed
class SeerrState with _$SeerrState {
  const factory SeerrState.initial() = SeerrInitial;
  const factory SeerrState.loading() = SeerrLoading;
  const factory SeerrState.loaded(List<Seerr> seerrList) = SeerrLoaded;
  const factory SeerrState.detailsLoaded(Seerr media) = DetailsLoaded;
  const factory SeerrState.error(String message) = SeerrError;
  const factory SeerrState.requestSuccess() = RequestSuccess;
}

class SeerrBloc extends Bloc<SeerrEvent, SeerrState> {
  final SearchSeerrUseCase searchSeerr;
  final GetTrendingSeerrUseCase getTrendingSeerr;
  final GetSeerrDetailsUseCase getSeerrDetails;
  final RequestSeerrUseCase requestSeerr;

  SeerrBloc({
    required this.searchSeerr,
    required this.getTrendingSeerr,
    required this.getSeerrDetails,
    required this.requestSeerr,
  }) : super(const SeerrInitial()) {
    on<SearchRequested>(_onSearchRequested);
    on<TrendingRequested>(_onTrendingRequested);
    on<DetailsRequested>(_onDetailsRequested);
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

  Future<void> _onDetailsRequested(DetailsRequested event, Emitter<SeerrState> emit) async {
    emit(const SeerrLoading());
    try {
      final details = await getSeerrDetails.execute(event.mediaId, event.mediaType);
      emit(DetailsLoaded(details));
    } catch (e) {
      emit(SeerrError(e.toString()));
    }
  }

  Future<void> _onRequestSeerr(RequestSeerr event, Emitter<SeerrState> emit) async {
    final currentState = state;
    try {
      await requestSeerr.execute(event.mediaId, event.mediaType, seasons: event.seasons);
      
      emit(const RequestSuccess());

      if (currentState is SeerrLoaded) {
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
        emit(SeerrLoaded(updatedList));
      } else if (currentState is DetailsLoaded) {
        // Update the current detail view
        final updatedMedia = currentState.media.copyWith(
          isRequested: true,
          status: 2, // Pending
        );
        emit(DetailsLoaded(updatedMedia));
      }
    } catch (e) {
      emit(SeerrError(e.toString()));
      if (currentState is SeerrLoaded || currentState is DetailsLoaded) {
        emit(currentState);
      }
    }
  }
}
