import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/usecases/get_services_status.dart';

part 'nas_status_bloc.freezed.dart';

@freezed
class NasStatusEvent with _$NasStatusEvent {
  const factory NasStatusEvent.refreshRequested() = RefreshRequested;
}

@freezed
class NasStatusState with _$NasStatusState {
  const factory NasStatusState.initial() = Initial;
  const factory NasStatusState.loading() = Loading;
  const factory NasStatusState.loaded(List<NasService> services) = Loaded;
  const factory NasStatusState.error(String message) = Error;
}

class NasStatusBloc extends Bloc<NasStatusEvent, NasStatusState> {
  final GetServicesStatusUseCase getServicesStatus;
  final SharedPreferences sharedPreferences;

  NasStatusBloc({
    required this.getServicesStatus,
    required this.sharedPreferences,
  }) : super(const Initial()) {
    on<RefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onRefreshRequested(
    RefreshRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    emit(const Loading());

    final nasUrl = sharedPreferences.getString('nas_url');
    if (nasUrl == null || nasUrl.isEmpty) {
      emit(const Error('Configure a URL do NAS nas configurações.'));
      return;
    }

    try {
      final services = await getServicesStatus.execute(nasUrl);
      emit(Loaded(services));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
