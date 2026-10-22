import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'presentation/blocs/nas_status_bloc.dart';
import 'presentation/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fontes JetBrains Mono são pré-buildadas em assets/google_fonts/;
  // isso garante zero download em runtime (nada de delay no primeiro load).
  GoogleFonts.config.allowRuntimeFetching = false;
  await di.init();
  runApp(const NasHomeApp());
}

class NasHomeApp extends StatelessWidget {
  const NasHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<NasStatusBloc>()..add(const RefreshRequested()),
      child: MaterialApp(
        title: 'NAS_MONITOR_v1.0',
        theme: AppTheme.darkTheme,
        home: const HomePage(),
      ),
    );
  }
}
