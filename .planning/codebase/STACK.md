# Technology Stack

**Analysis Date:** 2025-02-13

## Languages

**Primary:**
- Dart 3.7.0+ - Entire application logic, models, and UI.

## Runtime

**Environment:**
- Flutter SDK - Cross-platform framework for Mobile, Desktop, and Web.

**Package Manager:**
- pub - Dart package manager.
- Lockfile: `pubspec.lock` present.

## Frameworks

**Core:**
- Flutter - UI toolkit and application framework.
- flutter_bloc ^9.1.1 - State management using the BLoC pattern.

**Testing:**
- flutter_test (Flutter SDK) - Unit and widget testing framework.

**Build/Dev:**
- build_runner ^2.5.4 - Code generation tool.
- freezed ^3.1.0 - Data class and union type generator.
- json_serializable ^6.9.5 - JSON serialization generator.

## Key Dependencies

**Critical:**
- dio ^5.9.2 - HTTP client for API integrations.
- get_it ^9.2.1 - Service locator for dependency injection.
- shared_preferences ^2.5.3 - Local storage for settings and API keys.

**UI & Infrastructure:**
- design_system (local) - Custom design system located at `../design_system`.
- google_fonts ^6.3.2 - Custom typography.
- crypto ^3.0.7 - Cryptographic functions (e.g., hashing).

## Configuration

**Environment:**
- Local persistence via `shared_preferences`.
- Configuration keys include `nas_url`, `lidarr_api_key`, `seerr_api_key`, and `registry_token`.

**Build:**
- `pubspec.yaml`: Main dependency and metadata configuration.
- `analysis_options.yaml`: Linting rules.

## Platform Requirements

**Development:**
- Flutter SDK ^3.7.0.
- Android Studio / VS Code with Dart/Flutter plugins.

**Production:**
- Targets: Android, iOS, Linux, MacOS, Web, Windows (based on directory structure).

---

*Stack analysis: 2025-02-13*
