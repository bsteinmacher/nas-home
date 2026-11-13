import 'dart:async';

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
  const factory NasStatusEvent.updateAllRequested() = UpdateAllRequested;
}

enum NasNoticeKind { info, success, error }

class NasNotice {
  final String message;
  final NasNoticeKind kind;

  const NasNotice(this.message, {this.kind = NasNoticeKind.error});

  bool get isError => kind == NasNoticeKind.error;
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

  final StreamController<NasNotice> _notices = StreamController<NasNotice>.broadcast();

  /// Transient failures that must not replace the dashboard.
  Stream<NasNotice> get notices => _notices.stream;

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
    on<UpdateAllRequested>(_onUpdateAllRequested);
  }

  void _notify(String message, {NasNoticeKind kind = NasNoticeKind.error}) {
    if (!_notices.isClosed) {
      _notices.add(NasNotice(message, kind: kind));
    }
  }

  @override
  Future<void> close() {
    _notices.close();
    return super.close();
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
      emit(Loaded(services, hardwareInfo));
      _notify(
        'Falha ao verificar ${event.serviceName}. Confira a conexão e tente de novo.',
      );
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

    if (nasUrl == null || nasUrl.isEmpty || registryToken == null || registryToken.isEmpty) {
      _notify('Configure o endereço e o token do NAS nas configurações.');
      return;
    }

    final next = await _runUpdate(
      serviceName: event.serviceName,
      services: currentState.services,
      hardwareInfo: currentState.hardwareInfo,
      nasUrl: nasUrl,
      registryToken: registryToken,
      emit: emit,
    );
    emit(Loaded(next ?? currentState.services, currentState.hardwareInfo));
  }

  Future<void> _onUpdateAllRequested(
    UpdateAllRequested event,
    Emitter<NasStatusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final nasUrl = sharedPreferences.getString('nas_url');
    final registryToken = sharedPreferences.getString('registry_token');
    if (nasUrl == null || nasUrl.isEmpty || registryToken == null || registryToken.isEmpty) {
      _notify('Configure o endereço e o token do NAS nas configurações.');
      return;
    }

    final pending = currentState.services
        .where((service) => service.isDeployed && service.updateAvailable)
        .map((service) => service.name)
        .toList();
    if (pending.isEmpty) return;

    var services = currentState.services;
    var updated = 0;
    for (final name in pending) {
      _notify(
        'Atualizando ${name.toUpperCase()}.',
        kind: NasNoticeKind.info,
      );
      final next = await _runUpdate(
        serviceName: name,
        services: services,
        hardwareInfo: currentState.hardwareInfo,
        nasUrl: nasUrl,
        registryToken: registryToken,
        emit: emit,
      );
      if (next != null) {
        services = next;
        updated++;
      }
    }

    emit(Loaded(services, currentState.hardwareInfo));
    final total = pending.length;
    if (updated == total) {
      _notify(
        total == 1 ? '1 serviço atualizado.' : '$total serviços atualizados.',
        kind: NasNoticeKind.success,
      );
    } else {
      _notify('$updated de $total atualizados.');
    }
  }

  /// Runs one image update. Returns the refreshed list, or null on failure.
  Future<List<NasService>?> _runUpdate({
    required String serviceName,
    required List<NasService> services,
    required HardwareInfo hardwareInfo,
    required String nasUrl,
    required String registryToken,
    required Emitter<NasStatusState> emit,
  }) async {
    emit(NasStatusState.updating(serviceName, services, hardwareInfo));
    try {
      await nasRepository.updateService(nasUrl, registryToken, serviceName);
      await Future.delayed(const Duration(seconds: 5));

      final current = services.firstWhere(
        (service) => service.name.toLowerCase() == serviceName.toLowerCase(),
        orElse: () => NasService(name: serviceName, port: '', description: ''),
      );
      final refreshed = await nasRepository.refreshServiceUpdateInfo(
        nasUrl,
        registryToken,
        current,
      );
      return services
          .map((service) =>
              service.name.toLowerCase() == serviceName.toLowerCase() ? refreshed : service)
          .toList();
    } catch (e) {
      _notify('Falha ao atualizar $serviceName. Tente de novo em instantes.');
      return null;
    }
  }

Future<void> _fetchData(Emitter<NasStatusState> emit, {required bool forceUpdates}) async {
    // Se já temos dados carregados, mantém a UI estável e atualiza em
    // segundo plano (evita tela de loading quando o backend está lento).
    final hasData = state is Loaded || state is Updating || state is CheckingUpdate;
    if (!hasData) {
      emit(const Loading());
    }
    final nasUrl = sharedPreferences.getString('nas_url');
    final registryToken = sharedPreferences.getString('registry_token');

    if (nasUrl == null || nasUrl.isEmpty) {
      emit(const Error('Configure a URL do NAS nas configurações.'));
      return;
    }
    if (registryToken == null || registryToken.isEmpty) {
      emit(const Error('Configure o token do Registry nas configurações.'));
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
      final current = state;
      const notice = 'Falha ao atualizar o painel. Puxe para baixo para tentar de novo.';
      if (current is Loaded) {
        _notify(notice);
        return;
      }
      if (current is Updating) {
        emit(Loaded(current.services, current.hardwareInfo));
        _notify(notice);
        return;
      }
      if (current is CheckingUpdate) {
        emit(Loaded(current.services, current.hardwareInfo));
        _notify(notice);
        return;
      }
      emit(Error(e.toString()));
    }
  }
}
