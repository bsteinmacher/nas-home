import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/music_dl.dart';
import '../../blocs/music_dl_bloc.dart';
import '../../widgets/braille_spinner.dart';
import '../../widgets/service_scaffold.dart';
import '../../widgets/tui_dialog.dart';
import '../../widgets/tui_input_field.dart';
import '../../widgets/tui_progress_bar.dart';
import 'job_details_page.dart';

class SyncthingPage extends StatelessWidget {
  const SyncthingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MusicDlBloc>()..add(const MusicDlStarted()),
      child: const _SyncthingView(),
    );
  }
}

class _SyncthingView extends StatefulWidget {
  const _SyncthingView();

  @override
  State<_SyncthingView> createState() => _SyncthingViewState();
}

class _SyncthingViewState extends State<_SyncthingView> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();
  final TextEditingController _albumController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    _artistController.dispose();
    _albumController.dispose();
    super.dispose();
  }

  Future<void> _pasteUrl() async {
    final data = await Clipboard.getData('text/plain');
    final text = data?.text?.trim();
    if (text == null || text.isEmpty || !mounted) return;
    _urlController.text = text;
    context.read<MusicDlBloc>().add(MusicDlUrlChanged(text));
  }

  void _syncDrafts(MusicDlState state) {
    final artist = state.draftArtist ?? '';
    final album = state.draftAlbum ?? '';
    if (_artistController.text != artist) _artistController.text = artist;
    if (_albumController.text != album) _albumController.text = album;
  }

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'Syncthing',
      themeColor: AppColors.syncthing,
      body: BlocConsumer<MusicDlBloc, MusicDlState>(
        listenWhen: (previous, current) =>
            previous.notice != current.notice ||
            previous.error != current.error ||
            previous.draftArtist != current.draftArtist ||
            previous.draftAlbum != current.draftAlbum,
        listener: (context, state) {
          _syncDrafts(state);
          final message = state.error ?? state.notice;
          if (message == null || message.isEmpty) return;
          if (state.notice == null && state.error == null) return;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: state.error != null
                  ? const Color(0xFFB71C1C)
                  : AppColors.syncthing.withValues(alpha: 0.85),
            ),
          );
        },
        builder: (context, state) {
          if (state.loading && state.folders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final kind = state.inspection?.kind;
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              TuiInputField(
                label: 'YouTube URL',
                controller: _urlController,
                hintText: 'https://music.youtube.com/...',
                textInputAction: TextInputAction.done,
                onChanged: (value) =>
                    context.read<MusicDlBloc>().add(MusicDlUrlChanged(value)),
                onSubmitted: (_) {
                  if (!state.canDownload) return;
                  context.read<MusicDlBloc>().add(const MusicDlUrlSubmitted());
                },
                suffixIcon: IconButton(
                  tooltip: 'Colar',
                  onPressed: _pasteUrl,
                  icon: const Icon(Icons.paste, color: AppColors.textSecondary),
                ),
              ),
              if (state.inspecting) ...[
                const SizedBox(height: AppSpacing.md),
                const Row(
                  children: [
                    BrailleSpinner(fontSize: 16, color: AppColors.syncthing),
                    SizedBox(width: AppSpacing.sm),
                    Text('Detectando...'),
                  ],
                ),
              ],
              if (kind == 'album') ...[
                const SizedBox(height: AppSpacing.md),
                _AlbumCard(
                  inspection: state.inspection!,
                  artistController: _artistController,
                  albumController: _albumController,
                ),
              ] else if (kind == 'playlist') ...[
                const SizedBox(height: AppSpacing.md),
                _DetectedPlaylistCard(inspection: state.inspection!),
              ] else if (kind == 'video') ...[
                const SizedBox(height: AppSpacing.md),
                if ((state.inspection?.title ?? '').trim().isNotEmpty)
                  Text(
                    state.inspection!.title!,
                    style: AppTypography.moduleLabel.copyWith(fontSize: 13),
                  ),
              ],
              if (state.inspection != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: TuiDialogButton(
                    label: state.submitting
                        ? 'Enviando'
                        : state.hasActiveJobForUrl
                        ? 'Baixando'
                        : 'Baixar',
                    isPrimary: true,
                    color: state.canDownload
                        ? AppColors.syncthing
                        : AppColors.textMuted,
                    onPressed: state.canDownload
                        ? () => context.read<MusicDlBloc>().add(
                            const MusicDlUrlSubmitted(),
                          )
                        : () {},
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              Text('// JOBS', style: AppTypography.sectionHeader),
              const SizedBox(height: AppSpacing.sm),
              if (state.jobs.isEmpty)
                Text(
                  'Nenhum download ainda.',
                  style: AppTypography.moduleSublabel,
                ),
              ...state.jobs.map((job) => _JobTile(job: job)),
            ],
          );
        },
      ),
    );
  }
}

class _AlbumCard extends StatelessWidget {
  final MusicDlInspection inspection;
  final TextEditingController artistController;
  final TextEditingController albumController;

  const _AlbumCard({
    required this.inspection,
    required this.artistController,
    required this.albumController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// ÁLBUM · ${inspection.trackCount ?? 0} FAIXAS',
          style: AppTypography.sectionHeader,
        ),
        const SizedBox(height: AppSpacing.sm),
        TuiInputField(
          label: 'Artista',
          controller: artistController,
          onChanged: (value) =>
              context.read<MusicDlBloc>().add(MusicDlDraftArtistChanged(value)),
        ),
        const SizedBox(height: AppSpacing.sm),
        TuiInputField(
          label: 'Álbum',
          controller: albumController,
          onChanged: (value) =>
              context.read<MusicDlBloc>().add(MusicDlDraftAlbumChanged(value)),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Vai para music/${artistController.text}/${albumController.text}',
          style: AppTypography.moduleSublabel,
        ),
      ],
    );
  }
}

class _DetectedPlaylistCard extends StatelessWidget {
  final MusicDlInspection inspection;

  const _DetectedPlaylistCard({required this.inspection});

  @override
  Widget build(BuildContext context) {
    final title = (inspection.title ?? '').trim();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// PLAYLIST · ${inspection.trackCount ?? 0} FAIXAS',
          style: AppTypography.sectionHeader,
        ),
        if (title.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(title, style: AppTypography.moduleLabel.copyWith(fontSize: 13)),
        ],
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Cada faixa vai para music/Artista/Álbum',
          style: AppTypography.moduleSublabel,
        ),
      ],
    );
  }
}

class _JobTile extends StatelessWidget {
  final MusicDlJob job;

  const _JobTile({required this.job});

  @override
  Widget build(BuildContext context) {
    final overall = job.overallPercent;
    final errorSuffix = job.error == null ? '' : ' · ${job.error}';
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => JobDetailsPage(job: job)),
          );
        },
        child: TuiProgressBar(
          label: '${job.listLabel}$errorSuffix',
          percent: (overall / 100).clamp(0.0, 1.0),
          trailing: '${overall.round()}%',
          statusDot: jobStatusDotColor(job.status),
        ),
      ),
    );
  }
}
