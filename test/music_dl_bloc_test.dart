import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nas_home/domain/entities/music_dl.dart';
import 'package:nas_home/domain/repositories/music_dl_repository.dart';
import 'package:nas_home/domain/usecases/music_dl_usecases.dart';
import 'package:nas_home/presentation/blocs/music_dl_bloc.dart';

class _MockMusicDlRepository extends Mock implements MusicDlRepository {}

void main() {
  late _MockMusicDlRepository repository;

  const som = MusicFolder(name: 'Som', trackCount: 76);
  const queuedJob = MusicDlJob(
    id: 'job-1',
    url: 'https://music.youtube.com/watch?v=abc',
    folder: 'Som',
    mode: 'video',
    status: 'queued',
  );
  const doneJob = MusicDlJob(
    id: 'job-1',
    url: 'https://music.youtube.com/watch?v=abc',
    folder: 'Som',
    mode: 'video',
    status: 'done',
    percent: 100,
    title: 'Artist - Track',
  );
  const albumInspection = MusicDlInspection(
    kind: 'album',
    url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
    title: 'Pra Quem Já Mordeu um Cachorro por Comida Até Que Eu Cheguei Longe',
    artist: 'Emicida',
    trackCount: 25,
    suggestedArtist: 'Emicida',
    suggestedAlbum:
        'Pra Quem Já Mordeu um Cachorro por Comida Até Que Eu Cheguei Longe',
  );
  const playlistInspection = MusicDlInspection(
    kind: 'playlist',
    url: 'https://music.youtube.com/playlist?list=PLsom',
    title: 'SOM',
    trackCount: 76,
    suggestedFolder: 'Som',
    existingFolder: 'Som',
  );

  MusicDlBloc buildBloc() {
    return MusicDlBloc(
      getFolders: GetMusicFoldersUseCase(repository),
      createFolder: CreateMusicFolderUseCase(repository),
      getJobs: GetMusicJobsUseCase(repository),
      inspectUrl: InspectMusicUrlUseCase(repository),
      createJob: CreateMusicJobUseCase(repository),
      resyncFolder: ResyncMusicFolderUseCase(repository),
    );
  }

  setUp(() {
    repository = _MockMusicDlRepository();
    when(() => repository.getFolders()).thenAnswer((_) async => [som]);
    when(() => repository.getJobs()).thenAnswer((_) async => const []);
  });

  blocTest<MusicDlBloc, MusicDlState>(
    'carrega pastas e seleciona Som',
    build: buildBloc,
    act: (bloc) => bloc.add(const MusicDlStarted()),
    expect: () => [
      const MusicDlState(loading: true),
      const MusicDlState(
        loading: false,
        folders: [som],
        selectedFolder: 'Som',
      ),
    ],
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'rejeita URL vazia',
    build: buildBloc,
    seed: () => const MusicDlState(
      loading: false,
      folders: [som],
      selectedFolder: 'Som',
    ),
    act: (bloc) => bloc.add(const MusicDlUrlSubmitted()),
    expect: () => [
      const MusicDlState(
        loading: false,
        folders: [som],
        selectedFolder: 'Som',
        error: 'Cole uma URL do YouTube',
      ),
    ],
    verify: (_) => verifyNever(
      () => repository.createJob(
        url: any(named: 'url'),
        folder: any(named: 'folder'),
        setAlbum: any(named: 'setAlbum'),
        kind: any(named: 'kind'),
        artist: any(named: 'artist'),
        album: any(named: 'album'),
        title: any(named: 'title'),
      ),
    ),
  );

  const videoInspection = MusicDlInspection(
    kind: 'video',
    url: 'https://music.youtube.com/watch?v=dQw4w9WgXcQ',
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'URL de vídeo chama inspect e marca kind video',
    build: buildBloc,
    setUp: () {
      when(
        () => repository.inspect(any()),
      ).thenAnswer((_) async => videoInspection);
    },
    seed: () => const MusicDlState(loading: false, folders: [som]),
    act: (bloc) =>
        bloc.add(const MusicDlUrlChanged('https://youtu.be/dQw4w9WgXcQ')),
    wait: const Duration(milliseconds: 800),
    verify: (bloc) {
      verify(() => repository.inspect('https://youtu.be/dQw4w9WgXcQ')).called(1);
      expect(bloc.state.inspection?.kind, 'video');
    },
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'URL de álbum gera inspeção com artista e álbum',
    build: buildBloc,
    setUp: () {
      when(
        () => repository.inspect(any()),
      ).thenAnswer((_) async => albumInspection);
    },
    seed: () => const MusicDlState(loading: false, folders: [som]),
    act: (bloc) => bloc.add(
      const MusicDlUrlChanged(
        'https://music.youtube.com/playlist?list=OLAK5uy_abc',
      ),
    ),
    wait: const Duration(milliseconds: 800),
    verify: (bloc) {
      verify(
        () => repository.inspect(
          'https://music.youtube.com/playlist?list=OLAK5uy_abc',
        ),
      ).called(1);
      expect(bloc.state.inspection?.kind, 'album');
      expect(bloc.state.draftArtist, 'Emicida');
    },
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'submit de álbum envia kind, artist e album',
    build: buildBloc,
    setUp: () {
      when(
        () => repository.createJob(
          url: any(named: 'url'),
          folder: any(named: 'folder'),
          setAlbum: any(named: 'setAlbum'),
          kind: any(named: 'kind'),
          artist: any(named: 'artist'),
          album: any(named: 'album'),
          title: any(named: 'title'),
        ),
      ).thenAnswer((_) async => queuedJob);
      when(() => repository.getJobs()).thenAnswer((_) async => [queuedJob]);
    },
    seed: () => const MusicDlState(
      loading: false,
      folders: [som],
      url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
      inspection: albumInspection,
      draftArtist: 'Emicida',
      draftAlbum: 'Pra Quem Já Mordeu um Cachorro por Comida Até Que Eu Cheguei Longe',
    ),
    act: (bloc) => bloc.add(const MusicDlUrlSubmitted()),
    verify: (_) {
      verify(
        () => repository.createJob(
          url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
          kind: 'album',
          artist: 'Emicida',
          album:
              'Pra Quem Já Mordeu um Cachorro por Comida Até Que Eu Cheguei Longe',
          setAlbum: false,
        ),
      ).called(1);
    },
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'playlist envia job sem pasta YouTube',
    build: buildBloc,
    setUp: () {
      when(
        () => repository.createJob(
          url: any(named: 'url'),
          folder: any(named: 'folder'),
          setAlbum: any(named: 'setAlbum'),
          kind: any(named: 'kind'),
          artist: any(named: 'artist'),
          album: any(named: 'album'),
          title: any(named: 'title'),
        ),
      ).thenAnswer((_) async => queuedJob);
      when(() => repository.getJobs()).thenAnswer((_) async => [queuedJob]);
    },
    seed: () => const MusicDlState(
      loading: false,
      folders: [som],
      url: 'https://music.youtube.com/playlist?list=PLsom',
      inspection: playlistInspection,
    ),
    act: (bloc) => bloc.add(const MusicDlUrlSubmitted()),
    verify: (_) {
      verify(
        () => repository.createJob(
          url: 'https://music.youtube.com/playlist?list=PLsom',
          kind: 'playlist',
          setAlbum: false,
          title: 'SOM',
        ),
      ).called(1);
    },
  );

  blocTest<MusicDlBloc, MusicDlState>(
    'envia job de vídeo e atualiza a lista',
    build: buildBloc,
    setUp: () {
      when(
        () => repository.createJob(
          url: any(named: 'url'),
          folder: any(named: 'folder'),
          setAlbum: any(named: 'setAlbum'),
          kind: any(named: 'kind'),
          artist: any(named: 'artist'),
          album: any(named: 'album'),
          title: any(named: 'title'),
        ),
      ).thenAnswer((_) async => queuedJob);
      when(() => repository.getJobs()).thenAnswer((_) async => [queuedJob]);
    },
    seed: () => const MusicDlState(
      loading: false,
      folders: [som],
      selectedFolder: 'Som',
      url: 'https://youtu.be/dQw4w9WgXcQ',
    ),
    act: (bloc) => bloc.add(const MusicDlUrlSubmitted()),
    expect: () => [
      const MusicDlState(
        loading: false,
        submitting: true,
        folders: [som],
        selectedFolder: 'Som',
        url: 'https://youtu.be/dQw4w9WgXcQ',
      ),
      const MusicDlState(
        loading: false,
        folders: [som],
        jobs: [queuedJob],
        selectedFolder: 'Som',
        url: 'https://youtu.be/dQw4w9WgXcQ',
        notice: 'Download enviado para music/Artista/Álbum',
      ),
    ],
  );

  test('job ativo é queued/downloading/processing', () {
    expect(queuedJob.isActive, isTrue);
    expect(doneJob.isActive, isFalse);
  });

  test('progresso do álbum usa faixa atual sobre o total', () {
    const midAlbum = MusicDlJob(
      id: 'job-album',
      url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
      folder: 'Emicida/Album',
      mode: 'album',
      status: 'downloading',
      percent: 50,
      currentItem: 3,
      totalItems: 25,
    );
    expect(midAlbum.overallPercent, closeTo(10, 0.01));
    expect(doneJob.overallPercent, 100);
    expect(
      midAlbum
          .copyWith(
            artist: 'Emicida',
            album: 'Pra Quem',
            status: 'done',
            percent: 100,
            currentItem: 25,
            sponsorblockCut: true,
          )
          .listLabel,
      'Emicida - Pra Quem - 25/25 - CUT',
    );
    expect(
      doneJob.copyWith(sponsorblockCut: true).listLabel,
      'Artist - Track - CUT',
    );
    expect(
      const MusicDlJob(
        id: 'pl',
        url: 'https://music.youtube.com/playlist?list=PLsom',
        folder: 'Sarcastic Sounds',
        mode: 'playlist',
        status: 'done',
        title: 'Sarcastic Sounds',
        currentItem: 12,
        totalItems: 12,
        sponsorblockCut: true,
      ).listLabel,
      'Sarcastic Sounds - 12/12 - CUT',
    );
  });

  blocTest<MusicDlBloc, MusicDlState>(
    'não envia de novo enquanto o mesmo álbum está baixando',
    build: buildBloc,
    seed: () => const MusicDlState(
      loading: false,
      folders: [som],
      url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
      inspection: albumInspection,
      draftArtist: 'Emicida',
      draftAlbum: 'Pra Quem',
      jobs: [
        MusicDlJob(
          id: 'job-album',
          url: 'https://music.youtube.com/playlist?list=OLAK5uy_abc',
          folder: 'Emicida/Pra Quem',
          mode: 'album',
          status: 'downloading',
          currentItem: 2,
          totalItems: 25,
        ),
      ],
    ),
    act: (bloc) => bloc.add(const MusicDlUrlSubmitted()),
    expect: () => [
      isA<MusicDlState>().having(
        (state) => state.error,
        'error',
        'Esse download já está em andamento',
      ),
    ],
    verify: (_) => verifyNever(
      () => repository.createJob(
        url: any(named: 'url'),
        folder: any(named: 'folder'),
        setAlbum: any(named: 'setAlbum'),
        kind: any(named: 'kind'),
        artist: any(named: 'artist'),
        album: any(named: 'album'),
        title: any(named: 'title'),
      ),
    ),
  );
}
