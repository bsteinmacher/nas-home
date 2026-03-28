import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nasUrlController = TextEditingController();
  final _jellyseerrKeyController = TextEditingController();
  final _navidromeUserController = TextEditingController();
  final _navidromePassController = TextEditingController();
  final _prefs = sl<SharedPreferences>();

  @override
  void initState() {
    super.initState();
    _nasUrlController.text = _prefs.getString('nas_url') ?? '';
    _jellyseerrKeyController.text = _prefs.getString('jellyseerr_api_key') ?? '';
    _navidromeUserController.text = _prefs.getString('navidrome_user') ?? '';
    _navidromePassController.text = _prefs.getString('navidrome_pass') ?? '';
  }

  void _saveSettings() async {
    await _prefs.setString('nas_url', _nasUrlController.text);
    await _prefs.setString('jellyseerr_api_key', _jellyseerrKeyController.text);
    await _prefs.setString('navidrome_user', _navidromeUserController.text);
    await _prefs.setString('navidrome_pass', _navidromePassController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configurações salvas!')),
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
          style: AppTypography.terminalTitle.copyWith(fontSize: 14, color: AppColors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            _buildTextField(
              controller: _nasUrlController,
              label: 'URL do NAS (ex: http://192.168.1.10)',
            ),
            const SizedBox(height: AppSpacing.md),
            _buildTextField(
              controller: _jellyseerrKeyController,
              label: 'Jellyseerr API Key',
            ),
            const SizedBox(height: AppSpacing.md),
            _buildTextField(
              controller: _navidromeUserController,
              label: 'Navidrome Usuário',
            ),
            const SizedBox(height: AppSpacing.md),
            _buildTextField(
              controller: _navidromePassController,
              label: 'Navidrome Senha',
              obscureText: true,
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: AppTypography.baseStyle.copyWith(fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTypography.moduleSublabel.copyWith(fontSize: 12),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.terminalGreen),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.surfaceLighter),
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
