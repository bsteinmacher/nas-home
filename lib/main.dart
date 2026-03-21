import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const NasHomeApp());
}

class NasHomeApp extends StatelessWidget {
  const NasHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nas Home',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}
