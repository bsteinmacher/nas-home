import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../domain/entities/music_dl.dart';
import '../../../domain/usecases/music_dl_usecases.dart';
import '../../widgets/service_scaffold.dart';
import '../../widgets/tui_progress_bar.dart';

class JobDetailsPage extends StatefulWidget {
  final MusicDlJob job;

  const JobDetailsPage({super.key, required this.job});

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  late MusicDlJob _job;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _job = widget.job;
    _load();
  }

  Future<void> _load() async {
    try {
      final detailed = await sl<GetMusicJobUseCase>().execute(widget.job.id);
      if (!mounted) return;
      setState(() {
        _job = detailed;
        _loading = false;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ServiceScaffold(
      serviceName: 'JOB',
      themeColor: AppColors.syncthing,
      onLeadingPressed: () => Navigator.pop(context),
      registryActions: false,
      onRefresh: _load,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          TuiProgressBar(
            label: _job.listLabel,
            percent: (_job.overallPercent / 100).clamp(0.0, 1.0),
            trailing: '${_job.overallPercent.round()}%',
            statusDot: jobStatusDotColor(_job.status),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('// INFO', style: AppTypography.sectionHeader),
          const SizedBox(height: AppSpacing.sm),
          _InfoLine(label: 'STATUS', value: _job.status.toUpperCase()),
          _InfoLine(label: 'MODE', value: _job.mode),
          _InfoLine(label: 'FOLDER', value: _job.folder),
          if (_job.artist != null)
            _InfoLine(label: 'ARTIST', value: _job.artist!),
          if (_job.album != null) _InfoLine(label: 'ALBUM', value: _job.album!),
          if (_job.mode == 'video')
            _InfoLine(label: 'TITLE', value: _job.title ?? '-'),
          _InfoLine(label: 'PATH', value: _job.outputPath ?? '-'),
          _UrlLine(url: _job.url),
          if (_job.error != null) _InfoLine(label: 'ERROR', value: _job.error!),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '// FAIXAS · ${_job.files.length}',
            style: AppTypography.sectionHeader,
          ),
          const SizedBox(height: AppSpacing.sm),
          if (_loading)
            Text('Carregando...', style: AppTypography.moduleSublabel)
          else if (_error != null)
            Text(_error!, style: AppTypography.moduleSublabel)
          else if (_job.files.isEmpty)
            Text(
              'Nenhum arquivo listado ainda.',
              style: AppTypography.moduleSublabel,
            )
          else
            ..._job.files.map(
              (name) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Text(
                  name,
                  style: AppTypography.moduleLabel.copyWith(fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _UrlLine extends StatelessWidget {
  final String url;

  const _UrlLine({required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('URL', style: AppTypography.sectionHeader),
          GestureDetector(
            onTap: () {
              final uri = Uri.tryParse(url);
              if (uri == null) return;
              launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            child: Text(
              url,
              style: AppTypography.moduleLabel.copyWith(
                fontSize: 12,
                color: AppColors.syncthing,
                decoration: TextDecoration.none,
                decorationColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  final String label;
  final String value;

  const _InfoLine({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTypography.sectionHeader),
          Text(value, style: AppTypography.moduleLabel.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
