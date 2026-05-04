import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../../core/storage/secure_storage_service.dart';
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
  final _registryUrlController = TextEditingController();
  final _registryTokenController = TextEditingController();
  final _seerrKeyController = TextEditingController();
  final _lidarrKeyController = TextEditingController();
  final _prefs = sl<SharedPreferences>();
  final _secureStorage = sl<SecureStorageService>();
  bool _isSyncing = false;
  String? _lastSynced;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _nasUrlController.text = _prefs.getString('nas_url') ?? '';
    _registryUrlController.text = _prefs.getString('registry_url') ?? '';
    _lastSynced = _prefs.getString('last_registry_sync');
    
    // Read sensitive data from secure storage
    final token = await _secureStorage.read('registry_token');
    final seerrKey = await _secureStorage.read('seerr_api_key');
    final lidarrKey = await _secureStorage.read('lidarr_api_key');

    if (mounted) {
      setState(() {
        _registryTokenController.text = token ?? '';
        _seerrKeyController.text = seerrKey ?? '';
        _lidarrKeyController.text = lidarrKey ?? '';
      });
    }
  }

  Future<void> _syncFromRegistry() async {
    if (_registryUrlController.text.isEmpty || _registryTokenController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide Registry URL and Token')),
      );
      return;
    }

    setState(() => _isSyncing = true);
    try {
      await sl<SyncRegistryConfigUseCase>().execute(
        _registryUrlController.text,
        _registryTokenController.text,
      );
      
      // Reload values from secure storage after sync
      final seerrKey = await _secureStorage.read('seerr_api_key');
      final lidarrKey = await _secureStorage.read('lidarr_api_key');

      final now = DateTime.now();
      final timestamp = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
      await _prefs.setString('last_registry_sync', timestamp);

      if (mounted) {
        setState(() {
          _seerrKeyController.text = seerrKey ?? '';
          _lidarrKeyController.text = lidarrKey ?? '';
          _lastSynced = timestamp;
        });
        
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
    // Save non-sensitive data to shared preferences
    await _prefs.setString('nas_url', _nasUrlController.text);
    await _prefs.setString('registry_url', _registryUrlController.text);
    
    // Save sensitive data to secure storage
    await _secureStorage.write('registry_token', _registryTokenController.text);
    
    // Manual overrides (hidden but preserved if sync was run)
    if (_seerrKeyController.text.isNotEmpty) {
      await _secureStorage.write('seerr_api_key', _seerrKeyController.text);
    }
    if (_lidarrKeyController.text.isNotEmpty) {
      await _secureStorage.write('lidarr_api_key', _lidarrKeyController.text);
    }
    
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
              label: 'NAS_HOST_ADDRESS (FOR_HARDWARE_STATS)',
              hintText: '192.168.100.85',
            ),
            const SizedBox(height: AppSpacing.lg),
            
            Text('// REGISTRY_DISCOVERY_SERVICE', style: AppTypography.sectionHeader),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _registryUrlController,
              label: 'REGISTRY_SERVICE_URL',
              hintText: 'http://registry.meunas.home',
            ),
            const SizedBox(height: AppSpacing.sm),
            TuiInputField(
              controller: _registryTokenController,
              label: 'X_REGISTRY_TOKEN',
              hintText: 'token_xxxxxxxx...',
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Redesigned Sync Button
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        if (!_isSyncing && _lastSynced != null) ...[
                          const SizedBox(width: AppSpacing.sm),
                          const Icon(Icons.check_circle, size: 14, color: AppColors.terminalGreen),
                        ],
                      ],
                    ),
                  ),
                ),
                if (_lastSynced != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LAST_SUCCESSFUL_SYNC: $_lastSynced',
                          style: AppTypography.moduleSublabel.copyWith(fontSize: 10, color: AppColors.textMuted),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'ACTIVE_INTEGRATIONS:',
                          style: AppTypography.statusBadge.copyWith(fontSize: 10, color: AppColors.textMuted),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Wrap(
                          spacing: AppSpacing.sm,
                          children: [
                            if (_seerrKeyController.text.isNotEmpty)
                              _buildServiceBadge('SEERR'),
                            if (_lidarrKeyController.text.isNotEmpty)
                              _buildServiceBadge('LIDARR'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ],
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
    _registryUrlController.dispose();
    _registryTokenController.dispose();
    _seerrKeyController.dispose();
    _lidarrKeyController.dispose();
    super.dispose();
  }

  Widget _buildServiceBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.terminalGreen.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTypography.moduleSublabel.copyWith(fontSize: 9, color: AppColors.terminalGreen),
      ),
    );
  }
}
