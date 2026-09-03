import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/nas_service.dart';
import '../../domain/entities/hardware_info.dart';
import '../../domain/usecases/get_services_status.dart';
import '../../domain/usecases/get_hardware_info.dart';
import '../../domain/repositories/nas_repository.dart';

// Timing logs for load diagnostics (filter console by TIMING:)
// ignore_for_file: avoid_print

part 'nas_status_bloc.freezed.dart';

@freezed
abstract class NasStatusEvent with _$NasStatusEvent {
  const factory NasStatusEvent.refreshRequested() = RefreshRequested;
  const factory NasStatusEvent.checkUpdatesRequested() = CheckUpdatesRequested;
  const factory NasStatusEvent.checkServiceUpdateRequested(String serviceName) =
      CheckServiceUpdateRequested;
  const factory NasStatusEvent.updateServiceRequested(String serviceName) = UpdateServiceRequested;
}

@freezed
abstract class NasStatusState with _$NasStatusState {
  const factory NasStatusState.initial() = Initial;
  const factory NasStatusState.loading() = Loading;
  const factory NasStatusState.loaded(List<NasService> services, HardwareInfo hardwareInfo) = Loaded;
  const factory NasStatusState.updating(
    String serviceName, 
    List<NasService> services, 
    HardwareInfo hardwareInfo
  ) = Updating;
  const factory NasStatusState.checkingUpdate(
    String serviceName,
    List<NasService> services,
    HardwareInfo hardwareInfo,
  ) = CheckingUpdate;
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
    on<CheckServiceUpdateRequested>(_onCheckServiceUpdateRequested);
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

  Future<void> _onCheckServiceUpdateRequested(
    CheckServiceUpdateRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded &&
        currentState is! Updating &&
        currentState is! CheckingUpdate) {
      return;
    }

    final List<NasService> services;
    final HardwareInfo hardwareInfo;
    if (currentState is Loaded) {
      services = currentState.services;
      hardwareInfo = currentState.hardwareInfo;
    } else if (currentState is Updating) {
      services = currentState.services;
      hardwareInfo = currentState.hardwareInfo;
    } else {
      final checking = currentState as CheckingUpdate;
      services = checking.services;
      hardwareInfo = checking.hardwareInfo;
    }

    final nasUrl = sharedPreferences.getString('nas_url');
    final registryToken = sharedPreferences.getString('registry_token');
    if (nasUrl == null || nasUrl.isEmpty || registryToken == null || registryToken.isEmpty) {
      return;
    }

    final current = services.firstWhere(
      (s) => s.name.toLowerCase() == event.serviceName.toLowerCase(),
      orElse: () => NasService(name: event.serviceName, port: '', description: ''),
    );

    emit(CheckingUpdate(event.serviceName, services, hardwareInfo));

    final sw = Stopwatch()..start();
    print('TIMING: [HOME] check single service=${event.serviceName}');
    try {
      final updated = await nasRepository.refreshServiceUpdateInfo(
        nasUrl,
        registryToken,
        current,
      );
      final newServices = services
          .map((s) => s.name.toLowerCase() == event.serviceName.toLowerCase() ? updated : s)
          .toList();
      sw.stop();
      print(
        'TIMING: [HOME] check single service done in ${sw.elapsedMilliseconds}ms '
        'updateAvailable=${updated.updateAvailable}',
      );
      emit(Loaded(newServices, hardwareInfo));
    } catch (e) {
      sw.stop();
      print(
        'TIMING: [HOME] check single FAILED after ${sw.elapsedMilliseconds}ms: $e',
      );
      // Keep current dashboard; surface a soft error without wiping state.
      emit(Error('Falha ao checar update de ${event.serviceName}: $e'));
      emit(Loaded(services, hardwareInfo));
    }
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
      // Aguarda o container respirar e checa só este serviço
      await Future.delayed(const Duration(seconds: 5));

      final current = currentState.services.firstWhere(
        (s) => s.name.toLowerCase() == event.serviceName.toLowerCase(),
        orElse: () => NasService(name: event.serviceName, port: '', description: ''),
      );
      final refreshed = await nasRepository.refreshServiceUpdateInfo(
        nasUrl,
        registryToken,
        current,
      );
      final newServices = currentState.services
          .map((s) => s.name.toLowerCase() == event.serviceName.toLowerCase() ? refreshed : s)
          .toList();
      emit(Loaded(newServices, currentState.hardwareInfo));
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

    final totalSw = Stopwatch()..start();
    print(
      'TIMING: [HOME] refresh start forceUpdates=$forceUpdates url=$nasUrl',
    );

    try {
      final servicesSw = Stopwatch()..start();
      final hardwareSw = Stopwatch()..start();

      final servicesFuture = getServicesStatus
          .execute(nasUrl, registryToken: registryToken, force: forceUpdates)
          .whenComplete(() {
        servicesSw.stop();
        print(
          'TIMING: [HOME] services_status done in ${servicesSw.elapsedMilliseconds}ms',
        );
      });

      final hardwareFuture = getHardwareInfo.execute(nasUrl).whenComplete(() {
        hardwareSw.stop();
        print(
          'TIMING: [HOME] hardware_info done in ${hardwareSw.elapsedMilliseconds}ms',
        );
      });

      final results = await Future.wait([servicesFuture, hardwareFuture]);

      final services = results[0] as List<NasService>;
      final hardwareInfo = results[1] as HardwareInfo;

      totalSw.stop();
      final online = services.where((s) => s.isOnline).length;
      print(
        'TIMING: [HOME] refresh TOTAL ${totalSw.elapsedMilliseconds}ms '
        '(services=${servicesSw.elapsedMilliseconds}ms, '
        'hardware=${hardwareSw.elapsedMilliseconds}ms, '
        'online=$online/${services.length})',
      );

      emit(Loaded(services, hardwareInfo));
    } catch (e) {
      totalSw.stop();
      print(
        'TIMING: [HOME] refresh FAILED after ${totalSw.elapsedMilliseconds}ms: $e',
      );
      emit(Error(e.toString()));
    }
  }
}
