import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/usecases/sync_registry_config.dart';
import '../widgets/tui_input_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nasUrlController = TextEditingController();
  final _registryTokenController = TextEditingController();
  final _seerrKeyController = TextEditingController();
  final _lidarrKeyController = TextEditingController();
  final _prefs = sl<SharedPreferences>();
  bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    _nasUrlController.text = _prefs.getString('nas_url') ?? '';
    _registryTokenController.text = _prefs.getString('registry_token') ?? '';
    _seerrKeyController.text = _prefs.getString('seerr_api_key') ?? _prefs.getString('jellyseerr_api_key') ?? '';
    _lidarrKeyController.text = _prefs.getString('lidarr_api_key') ?? '';
  }

  Future<void> _syncFromRegistry() async {
    if (_nasUrlController.text.isEmpty || _registryTokenController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide NAS URL and Registry Token')),
      );
      return;
    }

    setState(() => _isSyncing = true);
    try {
      await sl<SyncRegistryConfigUseCase>().execute(
        _nasUrlController.text,
        _registryTokenController.text,
      );
      
      // Update local storage values in memory
      setState(() {
        _seerrKeyController.text = _prefs.getString('seerr_api_key') ?? '';
        _lidarrKeyController.text = _prefs.getString('lidarr_api_key') ?? '';
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('API Keys synced successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sync failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSyncing = false);
    }
  }

  void _saveSettings() async {
    await _prefs.setString('nas_url', _nasUrlController.text);
    await _prefs.setString('registry_token', _registryTokenController.text);
    // Even if manual fields are removed, we still save the controllers in case they were updated via SYNC
    await _prefs.setString('seerr_api_key', _seerrKeyController.text);
    await _prefs.setString('lidarr_api_key', _lidarrKeyController.text);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETTINGS_CONFIG',
          style: AppTypography.terminalTitle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('// CORE_SERVER_CONFIGURATION', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _nasUrlController,
              label: 'NAS_ADDRESS (IP/HOST)',
              hintText: '192.168.100.85',
            ),
            const SizedBox(height: AppSpacing.lg),
            
            Text('// REGISTRY_DISCOVERY_CREDENTIALS', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _registryTokenController,
              label: 'X_REGISTRY_TOKEN',
              hintText: 'token_xxxxxxxx...',
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Redesigned Sync Button
            InkWell(
              onTap: _isSyncing ? null : _syncFromRegistry,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.terminalGreen.withValues(alpha: 0.5)),
                  borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  color: AppColors.terminalGreen.withValues(alpha: 0.05),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isSyncing)
                      const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.terminalGreen),
                      )
                    else
                      const Icon(Icons.terminal, size: 16, color: AppColors.terminalGreen),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      _isSyncing ? 'INITIALIZING_SYNC...' : 'RUN_AUTO_DISCOVERY_SYNC',
                      style: AppTypography.statusBadge.copyWith(color: AppColors.terminalGreen),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Footer Info
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SYSTEM_NOTICE:', style: AppTypography.statusBadge.copyWith(color: AppColors.textMuted)),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Manual configuration keys have been deprecated. Use the Registry discovery service to manage all API integrations automatically.',
                    style: AppTypography.moduleSublabel,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveSettings,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.terminalGreen,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.borderRadius),
                  ),
                ),
                child: Text(
                  'COMMIT_CHANGES',
                  style: AppTypography.statusBadge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nasUrlController.dispose();
    _registryTokenController.dispose();
    _seerrKeyController.dispose();
    _lidarrKeyController.dispose();
    super.dispose();
  }
}
