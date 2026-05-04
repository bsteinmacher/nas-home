# Coding Conventions

**Analysis Date:** 2025-02-12

## Naming Patterns

**Files:**
- `snake_case.dart` for all Dart files.
- Parts files follow `filename.freezed.dart` or `filename.g.dart` patterns for generated code.

**Functions:**
- `camelCase()` for methods and top-level functions.
- Private methods start with underscore: `_privateMethod()`.

**Variables:**
- `camelCase` for local variables and properties.
- Private properties start with underscore: `_privateVariable`.

**Types:**
- `PascalCase` for Classes, Enums, and Typedefs.
- Interface Implementations: `{InterfaceName}Impl` (e.g., `NasRepositoryImpl`).
- BLoC: `{FeatureName}Bloc` (e.g., `NasStatusBloc`).
- Events: `{FeatureName}Event` (e.g., `NasStatusEvent`).
- States: `{FeatureName}State` (e.g., `NasStatusState`).
- UseCases: `{Action}{Entity}UseCase` (e.g., `GetHardwareInfoUseCase`).

## Code Style

**Formatting:**
- standard `flutter format` rules.
- 2-space indentation.
- Line length limit: 80 characters (default).

**Linting:**
- Tool: `flutter analyze`
- Config: `analysis_options.yaml` (includes `package:flutter_lints/flutter.yaml`).

## Import Organization

**Order:**
1. Flutter/Dart core imports (e.g., `package:flutter/material.dart`).
2. Third-party packages (e.g., `package:dio/dio.dart`, `package:flutter_bloc/flutter_bloc.dart`).
3. Relative imports for internal project files.

**Path Aliases:**
- Not currently used; relative paths are preferred for internal files.

## Error Handling

**Patterns:**
- Repositories and DataSources use `try-catch` blocks and return either results or throw exceptions.
- BLoCs catch exceptions and emit an `Error` state: `emit(Error(e.toString()))`.
- UI listens for `Error` states and displays error messages using `ErrorStateWidget`.

## Logging

**Framework:** `print` (observed in `NasRepositoryImpl`).

**Patterns:**
- Log errors in repositories: `print('Error fetching...: $e')`.
- Log URL requests for debugging: `print('Fetching... from: $apiUrl')`.

## Comments

**When to Comment:**
- Use `//!` headers in DI container to group registrations (Core, Data, Domain, Presentation).
- Document complex parsing logic in repositories (e.g., Glances API parsing in `NasRepositoryImpl`).

**JSDoc/TSDoc:**
- Use triple slash `///` for documentation comments on public APIs (not widely observed but standard).

## Function Design

**Size:** Functions are generally small and focused on a single responsibility.

**Parameters:** Prefer named parameters for better readability, especially in UI and constructors.

**Return Values:** Use `Future<T>` for asynchronous operations. Entities often use `@freezed` for immutability.

## Module Design

**Exports:** Classes are generally exported directly from their defining files.

**Barrel Files:** Not widely used in the current structure, but could be implemented for domain/entities.

---

*Convention analysis: 2025-02-12*
