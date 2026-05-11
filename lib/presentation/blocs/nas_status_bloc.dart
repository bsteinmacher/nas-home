import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/entities/hardware_info.dart';
import '../../domain/usecases/get_services_status.dart';
import '../../domain/usecases/get_hardware_info.dart';
import '../../domain/repositories/nas_repository.dart';

part 'nas_status_bloc.freezed.dart';

@freezed
class NasStatusEvent with _$NasStatusEvent {
  const factory NasStatusEvent.refreshRequested() = RefreshRequested;
  const factory NasStatusEvent.checkUpdatesRequested() = CheckUpdatesRequested;
  const factory NasStatusEvent.updateServiceRequested(String serviceName) = UpdateServiceRequested;
}

@freezed
class NasStatusState with _$NasStatusState {
  const factory NasStatusState.initial() = Initial;
  const factory NasStatusState.loading() = Loading;
  const factory NasStatusState.loaded(List<NasService> services, HardwareInfo hardwareInfo) = Loaded;
  const factory NasStatusState.updating(
    String serviceName, 
    List<NasService> services, 
    HardwareInfo hardwareInfo
  ) = Updating;
  const factory NasStatusState.error(String message) = Error;
}

class NasStatusBloc extends Bloc<NasStatusEvent, NasStatusState> {
  final GetServicesStatusUseCase getServicesStatus;
  final GetHardwareInfoUseCase getHardwareInfo;
  final SharedPreferences sharedPreferences;
  final NasRepository nasRepository;

  NasStatusBloc({
    required this.getServicesStatus,
    required this.getHardwareInfo,
    required this.sharedPreferences,
    required this.nasRepository,
  }) : super(const Initial()) {
    on<RefreshRequested>(_onRefreshRequested);
    on<CheckUpdatesRequested>(_onCheckUpdatesRequested);
    on<UpdateServiceRequested>(_onUpdateServiceRequested);
  }

  Future<void> _onRefreshRequested(
    RefreshRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    await _fetchData(emit, forceUpdates: false);
  }

  Future<void> _onCheckUpdatesRequested(
    CheckUpdatesRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    await _fetchData(emit, forceUpdates: true);
  }

  Future<void> _onUpdateServiceRequested(
    UpdateServiceRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final nasUrl = sharedPreferences.getString('nas_url');
    final registryToken = sharedPreferences.getString('registry_token');

    if (nasUrl == null || registryToken == null) return;

    // Preserva os dados atuais durante o update para evitar badges fantasmas
    emit(NasStatusState.updating(event.serviceName, currentState.services, currentState.hardwareInfo));

    try {
      await nasRepository.updateService(nasUrl, registryToken, event.serviceName);
      // Aguarda o container respirar e faz o check real (sem cache)
      await Future.delayed(const Duration(seconds: 5));
      await _fetchData(emit, forceUpdates: true);
    } catch (e) {
      emit(NasStatusState.error('Update failed: $e'));
      emit(Loaded(currentState.services, currentState.hardwareInfo));
    }
  }

  Future<void> _fetchData(Emitter<NasStatusState> emit, {required bool forceUpdates}) async {
    emit(const Loading());

    final nasUrl = sharedPreferences.getString('nas_url');
    final registryToken = sharedPreferences.getString('registry_token');

    if (nasUrl == null || nasUrl.isEmpty) {
      emit(const Error('Configure a URL do NAS nas configurações.'));
      return;
    }

    try {
      final results = await Future.wait([
        getServicesStatus.execute(nasUrl, registryToken: registryToken, force: forceUpdates),
        getHardwareInfo.execute(nasUrl),
      ]);

      final services = results[0] as List<NasService>;
      final hardwareInfo = results[1] as HardwareInfo;

      emit(Loaded(services, hardwareInfo));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
