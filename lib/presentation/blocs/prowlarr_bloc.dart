import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/prowlarr.dart';
import '../../domain/usecases/prowlarr_usecases.dart';

part 'prowlarr_bloc.freezed.dart';

@freezed
class ProwlarrEvent with _$ProwlarrEvent {
  const factory ProwlarrEvent.fetchIndexers() = FetchIndexers;
}

@freezed
class ProwlarrState with _$ProwlarrState {
  const factory ProwlarrState.initial() = ProwlarrInitial;
  const factory ProwlarrState.loading() = ProwlarrLoading;
  const factory ProwlarrState.loaded({
    required List<ProwlarrIndexer> indexers,
  }) = ProwlarrLoaded;
  const factory ProwlarrState.error(String message) = ProwlarrError;
}

class ProwlarrBloc extends Bloc<ProwlarrEvent, ProwlarrState> {
  final GetProwlarrIndexersUseCase getIndexers;

  ProwlarrBloc({
    required this.getIndexers,
  }) : super(const ProwlarrInitial()) {
    on<FetchIndexers>(_onFetchIndexers);
  }

  Future<void> _onFetchIndexers(FetchIndexers event, Emitter<ProwlarrState> emit) async {
    emit(const ProwlarrLoading());
    try {
      final indexers = await getIndexers.execute();
      emit(ProwlarrLoaded(indexers: indexers));
    } catch (e) {
      emit(ProwlarrError(e.toString()));
    }
  }
}
