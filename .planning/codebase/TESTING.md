# Testing Patterns

**Analysis Date:** 2025-02-12

## Test Framework

**Runner:**
- Flutter Test Runner (`flutter test`)
- SDK: `^3.7.0`

**Assertion Library:**
- `flutter_test` (built-in)

**Run Commands:**
```bash
flutter test              # Run all tests
flutter test --watch      # Watch mode (if available via IDE)
flutter test --coverage   # Coverage
```

## Test File Organization

**Location:**
- Separate `test/` directory at project root.

**Naming:**
- `*_test.dart` (e.g., `widget_test.dart`).

**Structure:**
```
test/
└── widget_test.dart
```

## Test Structure

**Suite Organization:**
```dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FeatureName', () {
    testWidgets('Description', (WidgetTester tester) async {
      // Setup
      // Action
      // Assertion
    });
  });
}
```

**Patterns:**
- Standard AAA (Arrange, Act, Assert) pattern.

## Mocking

**Framework:** Not explicitly configured in `pubspec.yaml`, but `mocktail` or `mockito` are recommended for Flutter projects.

**Patterns:**
- No mocks currently implemented.

**What to Mock:**
- Repositories when testing UseCases.
- DataSources when testing Repositories.
- Dio (HTTP client) when testing DataSources.

**What NOT to Mock:**
- Domain Entities.
- Pure utility functions.

## Fixtures and Factories

**Test Data:**
- Manual instantiation of Entities in tests.

**Location:**
- Recommended: `test/fixtures/`

## Coverage

**Requirements:** None enforced currently.

**View Coverage:**
```bash
flutter test --coverage
# Use a tool like lcov to view results
```

## Test Types

**Unit Tests:**
- Intended for `domain/usecases` and `data/repositories`.
- Currently missing.

**Widget Tests:**
- Intended for `presentation/widgets` and `presentation/pages`.
- Boilerplate `test/widget_test.dart` exists.

**Integration Tests:**
- Not used.

## Common Patterns

**Async Testing:**
```dart
test('description', () async {
  final result = await useCase.execute();
  expect(result, isNotNull);
});
```

**Error Testing:**
```dart
test('should throw error', () async {
  expect(() => datasource.call(), throwsException);
});
```

---

*Testing analysis: 2025-02-12*
