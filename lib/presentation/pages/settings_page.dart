import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/tui_input_field.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nasUrlController = TextEditingController();
  final _jellyseerrKeyController = TextEditingController();
  final _lidarrKeyController = TextEditingController();
  final _navidromeUserController = TextEditingController();
  final _navidromePassController = TextEditingController();
  final _prefs = sl<SharedPreferences>();

  @override
  void initState() {
    super.initState();
    _nasUrlController.text = _prefs.getString('nas_url') ?? '';
    _jellyseerrKeyController.text = _prefs.getString('jellyseerr_api_key') ?? '';
    _lidarrKeyController.text = _prefs.getString('lidarr_api_key') ?? '';
    _navidromeUserController.text = _prefs.getString('navidrome_user') ?? '';
    _navidromePassController.text = _prefs.getString('navidrome_pass') ?? '';
  }

  void _saveSettings() async {
    await _prefs.setString('nas_url', _nasUrlController.text);
    await _prefs.setString('jellyseerr_api_key', _jellyseerrKeyController.text);
    await _prefs.setString('lidarr_api_key', _lidarrKeyController.text);
    await _prefs.setString('navidrome_user', _navidromeUserController.text);
    await _prefs.setString('navidrome_pass', _navidromePassController.text);
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
          style: AppTypography.terminalTitle.copyWith(fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            TuiInputField(
              controller: _nasUrlController,
              label: 'NAS URL (ex: http://192.168.1.10)',
              hintText: 'http://...',
            ),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _jellyseerrKeyController,
              label: 'Jellyseerr API Key',
              hintText: 'xxxxxxxx...',
            ),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _navidromeUserController,
              label: 'Navidrome Username',
              hintText: 'admin...',
            ),
            const SizedBox(height: AppSpacing.md),
            TuiInputField(
              controller: _navidromePassController,
              label: 'Navidrome Password',
              obscureText: true,
              hintText: '********',
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
                  'SAVE_CONFIGURATION',
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
    _jellyseerrKeyController.dispose();
    _navidromeUserController.dispose();
    _navidromePassController.dispose();
    super.dispose();
  }
}
