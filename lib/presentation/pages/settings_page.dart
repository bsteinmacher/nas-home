import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';

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
      appBar: AppBar(title: const Text('Configurações')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nasUrlController,
              decoration: const InputDecoration(
                labelText: 'URL do NAS (ex: http://192.168.1.10)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _jellyseerrKeyController,
              decoration: const InputDecoration(
                labelText: 'Jellyseerr API Key',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _navidromeUserController,
              decoration: const InputDecoration(
                labelText: 'Navidrome Usuário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _navidromePassController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Navidrome Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Salvar'),
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
