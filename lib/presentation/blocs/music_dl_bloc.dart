import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/music_dl.dart';
import '../../domain/usecases/music_dl_usecases.dart';

part 'music_dl_bloc.freezed.dart';

@freezed
abstract class MusicDlEvent with _$MusicDlEvent {
  const factory MusicDlEvent.started() = MusicDlStarted;
  const factory MusicDlEvent.urlChanged(String url) = MusicDlUrlChanged;
  const factory MusicDlEvent.inspectRequested(String url, int generation) =
      MusicDlInspectRequested;
  const factory MusicDlEvent.urlSubmitted() = MusicDlUrlSubmitted;
  const factory MusicDlEvent.folderSelected(String? folder) =
      MusicDlFolderSelected;
  const factory MusicDlEvent.folderCreated(String name) = MusicDlFolderCreated;
  const factory MusicDlEvent.setAlbumChanged(bool value) =
      MusicDlSetAlbumChanged;
  const factory MusicDlEvent.draftArtistChanged(String value) =
      MusicDlDraftArtistChanged;
  const factory MusicDlEvent.draftAlbumChanged(String value) =
      MusicDlDraftAlbumChanged;
  const factory MusicDlEvent.draftFolderChanged(String value) =
      MusicDlDraftFolderChanged;
  const factory MusicDlEvent.resyncRequested(String folder) =
      MusicDlResyncRequested;
  const factory MusicDlEvent.pollRequested() = MusicDlPollRequested;
}

@freezed
abstract class MusicDlState with _$MusicDlState {
  const MusicDlState._();

  const factory MusicDlState({
    @Default(true) bool loading,
    @Default(false) bool submitting,
    @Default(false) bool inspecting,
    @Default('') String url,
    @Default([]) List<MusicFolder> folders,
    @Default([]) List<MusicDlJob> jobs,
    MusicDlInspection? inspection,
    String? selectedFolder,
    String? draftArtist,
    String? draftAlbum,
    String? draftFolder,
    @Default(true) bool setAlbum,
    String? error,
    String? notice,
  }) = _MusicDlState;

  bool get hasActiveJobForUrl {
    if (url.isEmpty) return false;
    return jobs.any((job) => job.isActive && job.isSameSource(url));
  }

  bool get downloadBlocked => submitting || inspecting || hasActiveJobForUrl;

  bool get canDownload {
    if (downloadBlocked || inspection == null) return false;
    switch (inspection!.kind) {
      case 'album':
        return (draftArtist ?? '').trim().isNotEmpty &&
            (draftAlbum ?? '').trim().isNotEmpty;
      case 'playlist':
      case 'video':
        return true;
      default:
        return false;
    }
  }
}

class MusicDlBloc extends Bloc<MusicDlEvent, MusicDlState> {
  final GetMusicFoldersUseCase getFolders;
  final CreateMusicFolderUseCase createFolder;
  final GetMusicJobsUseCase getJobs;
  final InspectMusicUrlUseCase inspectUrl;
  final CreateMusicJobUseCase createJob;
  final ResyncMusicFolderUseCase resyncFolder;

  Timer? _pollTimer;
  Timer? _inspectTimer;
  int _inspectGeneration = 0;

  MusicDlBloc({
    required this.getFolders,
    required this.createFolder,
    required this.getJobs,
    required this.inspectUrl,
    required this.createJob,
    required this.resyncFolder,
  }) : super(const MusicDlState()) {
    on<MusicDlStarted>(_onStarted);
    on<MusicDlUrlChanged>(_onUrlChanged);
    on<MusicDlInspectRequested>(_onInspectRequested);
    on<MusicDlUrlSubmitted>(_onUrlSubmitted);
    on<MusicDlFolderSelected>(_onFolderSelected);
    on<MusicDlFolderCreated>(_onFolderCreated);
    on<MusicDlSetAlbumChanged>(_onSetAlbumChanged);
    on<MusicDlDraftArtistChanged>(_onDraftArtistChanged);
    on<MusicDlDraftAlbumChanged>(_onDraftAlbumChanged);
    on<MusicDlDraftFolderChanged>(_onDraftFolderChanged);
    on<MusicDlResyncRequested>(_onResyncRequested);
    on<MusicDlPollRequested>(_onPollRequested);
  }

  bool _looksLikeYoutube(String url) {
    final lower = url.toLowerCase();
    return lower.contains('youtube.com') || lower.contains('youtu.be');
  }

  void _syncPolling(List<MusicDlJob> jobs) {
    final hasActive = jobs.any((job) => job.isActive);
    if (hasActive && _pollTimer == null) {
      _pollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
        add(const MusicDlPollRequested());
      });
    } else if (!hasActive) {
      _pollTimer?.cancel();
      _pollTimer = null;
    }
  }

  String? _pickFolder(List<MusicFolder> folders, String? current) {
    if (folders.any((folder) => folder.name == current)) return current;
    for (final folder in folders) {
      if (folder.name.toLowerCase() == 'som') return folder.name;
    }
    return folders.isEmpty ? null : folders.first.name;
  }

  Future<void> _onStarted(
    MusicDlStarted event,
    Emitter<MusicDlState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final folders = await getFolders.execute();
      final jobs = await getJobs.execute();
      emit(
        state.copyWith(
          loading: false,
          folders: folders,
          jobs: jobs,
          selectedFolder: _pickFolder(folders, state.selectedFolder),
        ),
      );
      _syncPolling(jobs);
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  void _onUrlChanged(MusicDlUrlChanged event, Emitter<MusicDlState> emit) {
    final url = event.url.trim();
    _inspectTimer?.cancel();
    _inspectGeneration++;
    if (url.isEmpty || !_looksLikeYoutube(url)) {
      emit(
        state.copyWith(
          url: url,
          inspecting: false,
          inspection: null,
          draftArtist: null,
          draftAlbum: null,
          draftFolder: null,
        ),
      );
      return;
    }
    final generation = _inspectGeneration;
    emit(
      state.copyWith(
        url: url,
        inspecting: true,
        inspection: null,
        error: null,
      ),
    );
    _inspectTimer = Timer(const Duration(milliseconds: 600), () {
      add(MusicDlInspectRequested(url, generation));
    });
  }

  Future<void> _onInspectRequested(
    MusicDlInspectRequested event,
    Emitter<MusicDlState> emit,
  ) async {
    if (event.generation != _inspectGeneration) return;
    try {
      final inspection = await inspectUrl.execute(event.url);
      if (event.generation != _inspectGeneration) return;
      emit(
        state.copyWith(
          inspecting: false,
          inspection: inspection,
          draftArtist: inspection.suggestedArtist,
          draftAlbum: inspection.suggestedAlbum,
          draftFolder: inspection.existingFolder ?? inspection.suggestedFolder,
          error: null,
        ),
      );
    } catch (e) {
      if (event.generation != _inspectGeneration) return;
      emit(state.copyWith(inspecting: false, error: e.toString()));
    }
  }

  void _onFolderSelected(
    MusicDlFolderSelected event,
    Emitter<MusicDlState> emit,
  ) {
    emit(state.copyWith(selectedFolder: event.folder, notice: null));
  }

  void _onSetAlbumChanged(
    MusicDlSetAlbumChanged event,
    Emitter<MusicDlState> emit,
  ) {
    emit(state.copyWith(setAlbum: event.value));
  }

  void _onDraftArtistChanged(
    MusicDlDraftArtistChanged event,
    Emitter<MusicDlState> emit,
  ) {
    emit(state.copyWith(draftArtist: event.value));
  }

  void _onDraftAlbumChanged(
    MusicDlDraftAlbumChanged event,
    Emitter<MusicDlState> emit,
  ) {
    emit(state.copyWith(draftAlbum: event.value));
  }

  void _onDraftFolderChanged(
    MusicDlDraftFolderChanged event,
    Emitter<MusicDlState> emit,
  ) {
    emit(state.copyWith(draftFolder: event.value));
  }

  Future<void> _onFolderCreated(
    MusicDlFolderCreated event,
    Emitter<MusicDlState> emit,
  ) async {
    final name = event.name.trim();
    if (name.isEmpty) {
      emit(state.copyWith(error: 'Informe o nome da playlist'));
      return;
    }
    emit(state.copyWith(submitting: true, error: null, notice: null));
    try {
      final folders = await createFolder.execute(name);
      emit(
        state.copyWith(
          submitting: false,
          folders: folders,
          selectedFolder: _pickFolder(folders, name),
          notice: 'Playlist $name criada',
        ),
      );
    } catch (e) {
      emit(state.copyWith(submitting: false, error: e.toString()));
    }
  }

  Future<void> _onUrlSubmitted(
    MusicDlUrlSubmitted event,
    Emitter<MusicDlState> emit,
  ) async {
    final url = state.url.trim();
    if (url.isEmpty) {
      emit(state.copyWith(error: 'Cole uma URL do YouTube'));
      return;
    }
    if (state.hasActiveJobForUrl) {
      emit(state.copyWith(error: 'Esse download já está em andamento'));
      return;
    }
    final inspection = state.inspection;
    if (inspection?.kind == 'album') {
      final artist = state.draftArtist?.trim() ?? '';
      final album = state.draftAlbum?.trim() ?? '';
      if (artist.isEmpty || album.isEmpty) {
        emit(state.copyWith(error: 'Preencha artista e álbum'));
        return;
      }
      emit(state.copyWith(submitting: true, error: null, notice: null));
      try {
        await createJob.execute(
          url: url,
          kind: 'album',
          artist: artist,
          album: album,
          setAlbum: false,
        );
        final jobs = await getJobs.execute();
        emit(
          state.copyWith(
            submitting: false,
            jobs: jobs,
            notice: 'Álbum enviado para $artist/$album',
          ),
        );
        _syncPolling(jobs);
      } catch (e) {
        emit(state.copyWith(submitting: false, error: e.toString()));
      }
      return;
    }
    if (inspection?.kind == 'playlist') {
      emit(state.copyWith(submitting: true, error: null, notice: null));
      try {
        await createJob.execute(
          url: url,
          kind: 'playlist',
          setAlbum: false,
          title: inspection?.title,
        );
        final jobs = await getJobs.execute();
        emit(
          state.copyWith(
            submitting: false,
            jobs: jobs,
            notice: 'Playlist enviada para music/Artista/Álbum',
          ),
        );
        _syncPolling(jobs);
      } catch (e) {
        emit(state.copyWith(submitting: false, error: e.toString()));
      }
      return;
    }
    emit(state.copyWith(submitting: true, error: null, notice: null));
    try {
      await createJob.execute(
        url: url,
        setAlbum: false,
        kind: 'video',
        title: inspection?.title,
      );
      final jobs = await getJobs.execute();
      emit(
        state.copyWith(
          submitting: false,
          jobs: jobs,
          notice: 'Download enviado para music/Artista/Álbum',
        ),
      );
      _syncPolling(jobs);
    } catch (e) {
      emit(state.copyWith(submitting: false, error: e.toString()));
    }
  }

  Future<void> _onResyncRequested(
    MusicDlResyncRequested event,
    Emitter<MusicDlState> emit,
  ) async {
    emit(state.copyWith(submitting: true, error: null, notice: null));
    try {
      await resyncFolder.execute(event.folder);
      final jobs = await getJobs.execute();
      emit(
        state.copyWith(
          submitting: false,
          jobs: jobs,
          notice: 'Re-sincronizando ${event.folder}',
        ),
      );
      _syncPolling(jobs);
    } catch (e) {
      emit(state.copyWith(submitting: false, error: e.toString()));
    }
  }

  Future<void> _onPollRequested(
    MusicDlPollRequested event,
    Emitter<MusicDlState> emit,
  ) async {
    try {
      final jobs = await getJobs.execute();
      final folders = await getFolders.execute();
      emit(
        state.copyWith(jobs: jobs, folders: folders, error: null, notice: null),
      );
      _syncPolling(jobs);
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _pollTimer?.cancel();
    _inspectTimer?.cancel();
    return super.close();
  }
}
