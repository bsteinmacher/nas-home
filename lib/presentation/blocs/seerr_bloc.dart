import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/seerr.dart';
import '../../domain/usecases/seerr_usecases.dart';

part 'seerr_bloc.freezed.dart';

@freezed
abstract class SeerrEvent with _$SeerrEvent {
  const factory SeerrEvent.searchRequested(String query) = SearchRequested;
  const factory SeerrEvent.trendingRequested() = TrendingRequested;
  const factory SeerrEvent.detailsRequested(int mediaId, String mediaType) = DetailsRequested;
  const factory SeerrEvent.mediaRequested(int mediaId, String mediaType, {List<int>? seasons}) = RequestSeerr;
  const factory SeerrEvent.restoreListRequested() = RestoreListRequested;
}

@freezed
abstract class SeerrState with _$SeerrState {
  const factory SeerrState.initial() = SeerrInitial;
  const factory SeerrState.loading() = SeerrLoading;
  const factory SeerrState.loaded(List<Seerr> seerrList, {@Default(false) bool fromSearch}) = SeerrLoaded;
  const factory SeerrState.detailsLoaded(
    Seerr media,
    List<Seerr> previousList, {
    @Default(false) bool fromSearch,
  }) = DetailsLoaded;
  const factory SeerrState.error(String message) = SeerrError;
  const factory SeerrState.requestSuccess() = RequestSuccess;
}

class SeerrBloc extends Bloc<SeerrEvent, SeerrState> {
  final SearchSeerrUseCase searchSeerr;
  final GetTrendingSeerrUseCase getTrendingSeerr;
  final GetSeerrDetailsUseCase getSeerrDetails;
  final RequestSeerrUseCase requestSeerr;

  List<Seerr> _lastList = const [];
  bool _lastFromSearch = false;

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
    on<RestoreListRequested>(_onRestoreListRequested);
  }

  Future<void> _onSearchRequested(SearchRequested event, Emitter<SeerrState> emit) async {
    emit(const SeerrLoading());
    try {
      final results = await searchSeerr.execute(event.query);
      _lastList = results;
      _lastFromSearch = true;
      emit(SeerrLoaded(results, fromSearch: true));
    } catch (e) {
      emit(SeerrError(e.toString()));
    }
  }

  Future<void> _onTrendingRequested(TrendingRequested event, Emitter<SeerrState> emit) async {
    emit(const SeerrLoading());
    try {
      final results = await getTrendingSeerr.execute();
      _lastList = results;
      _lastFromSearch = false;
      emit(SeerrLoaded(results, fromSearch: false));
    } catch (e) {
      emit(SeerrError(e.toString()));
    }
  }

  Future<void> _onDetailsRequested(DetailsRequested event, Emitter<SeerrState> emit) async {
    final previousList = state.maybeWhen(
      loaded: (list, _) => list,
      detailsLoaded: (_, prev, fromSearch) => prev,
      orElse: () => _lastList,
    );
    final fromSearch = state.maybeWhen(
      loaded: (_, fromSearch) => fromSearch,
      detailsLoaded: (_, prev, fromSearch) => fromSearch,
      orElse: () => _lastFromSearch,
    );

    _lastList = previousList;
    _lastFromSearch = fromSearch;

    // Keep previous list for when details route is popped.
    try {
      final details = await getSeerrDetails.execute(event.mediaId, event.mediaType);
      emit(DetailsLoaded(details, previousList, fromSearch: fromSearch));
    } catch (e) {
      emit(SeerrError(e.toString()));
      if (previousList.isNotEmpty) {
        emit(SeerrLoaded(previousList, fromSearch: fromSearch));
      }
    }
  }

  Future<void> _onRestoreListRequested(RestoreListRequested event, Emitter<SeerrState> emit) async {
    if (_lastList.isEmpty) {
      add(const TrendingRequested());
      return;
    }
    emit(SeerrLoaded(_lastList, fromSearch: _lastFromSearch));
  }

  Future<void> _onRequestSeerr(RequestSeerr event, Emitter<SeerrState> emit) async {
    final currentState = state;
    try {
      await requestSeerr.execute(event.mediaId, event.mediaType, seasons: event.seasons);

      emit(const RequestSuccess());

      if (currentState is SeerrLoaded) {
        final updatedList = currentState.seerrList.map((item) {
          if (item.id == event.mediaId) {
            return item.copyWith(
              isRequested: true,
              status: 2, // Pending
            );
          }
          return item;
        }).toList();
        _lastList = updatedList;
        emit(SeerrLoaded(updatedList, fromSearch: currentState.fromSearch));
      } else if (currentState is DetailsLoaded) {
        final updatedMedia = currentState.media.copyWith(
          isRequested: true,
          status: 2, // Pending
        );
        final updatedPrev = currentState.previousList.map((item) {
          if (item.id == event.mediaId) {
            return item.copyWith(isRequested: true, status: 2);
          }
          return item;
        }).toList();
        _lastList = updatedPrev;
        emit(DetailsLoaded(updatedMedia, updatedPrev, fromSearch: currentState.fromSearch));
      }
    } catch (e) {
      emit(SeerrError(e.toString()));
      if (currentState is SeerrLoaded || currentState is DetailsLoaded) {
        emit(currentState);
      }
    }
  }
}
