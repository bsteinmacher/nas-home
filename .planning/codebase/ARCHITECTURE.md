<!-- refreshed: 2025-02-13 -->
# Architecture

**Analysis Date:** 2025-02-13

## System Overview

```text
┌─────────────────────────────────────────────────────────────┐
│                      Presentation Layer                     │
├──────────────────┬──────────────────┬───────────────────────┤
│      Pages       │      BLoCs       │       Widgets         │
│ `lib/presentation/pages` `lib/presentation/blocs` `lib/presentation/widgets`│
└────────┬─────────┴────────┬─────────┴──────────┬────────────┘
         │                  │                     │
         ▼                  ▼                     ▼
┌─────────────────────────────────────────────────────────────┐
│                        Domain Layer                         │
│ `lib/domain/usecases` `lib/domain/entities` `lib/domain/repositories` (interfaces) │
└─────────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────┐
│                         Data Layer                          │
│ `lib/data/repositories` (impl) `lib/data/datasources`        │
└─────────────────────────────────────────────────────────────┘
```

## Component Responsibilities

| Component | Responsibility | File |
|-----------|----------------|------|
| NasHomeApp | Entry point, app configuration | `lib/main.dart` |
| NasStatusBloc | Orchestrates hardware and service status state | `lib/presentation/blocs/nas_status_bloc.dart` |
| SeerrBloc | Handles media requests and trending content | `lib/presentation/blocs/seerr_bloc.dart` |
| GetServicesStatusUseCase | Fetches status of all NAS services | `lib/domain/usecases/get_services_status.dart` |
| NasRepositoryImpl | Implementation of NAS data retrieval via HTTP | `lib/data/repositories/nas_repository_impl.dart` |
| Injection Container | Dependency injection registry | `lib/core/di/injection_container.dart` |

## Pattern Overview

**Overall:** Clean Architecture with BLoC Pattern

**Key Characteristics:**
- **Separation of Concerns:** Clear split between UI (Presentation), Business Logic (Domain), and Data Retrieval (Data).
- **Unidirectional Data Flow:** Events go from UI to BLoC, and States flow from BLoC to UI.
- **Dependency Inversion:** Use Cases depend on Repository interfaces, while implementations live in the Data layer.

## Layers

**Presentation:**
- Purpose: Displaying information and handling user interactions.
- Location: `lib/presentation`
- Contains: Flutter Widgets, Pages, and BLoC classes.
- Depends on: Domain (Use Cases).
- Used by: Flutter Framework (via `runApp`).

**Domain:**
- Purpose: Contains business logic and pure domain models.
- Location: `lib/domain`
- Contains: Entities, Use Cases, and Repository interfaces.
- Depends on: None (Pure Dart, minimal external deps like `freezed`).
- Used by: Presentation.

**Data:**
- Purpose: Handles data retrieval from remote (APIs) and local sources.
- Location: `lib/data`
- Contains: Repository implementations and Data Sources.
- Depends on: Domain (interfaces), `dio`, `shared_preferences`.
- Used by: Domain (via dependency injection).

## Data Flow

### Primary Request Path (NAS Status)

1. **User triggers Refresh:** `HomePage` dispatches `NasStatusEvent.refreshRequested()` to `NasStatusBloc` (`lib/presentation/pages/home_page.dart`).
2. **BLoC Processing:** `NasStatusBloc` calls `GetServicesStatusUseCase` and `GetHardwareInfoUseCase` (`lib/presentation/blocs/nas_status_bloc.dart`).
3. **Use Case Execution:** Use Case calls `NasRepository.getServices()` or `getHardwareInfo()` (`lib/domain/usecases/get_services_status.dart`).
4. **Data Retrieval:** `NasRepositoryImpl` performs HTTP requests using `Dio` to the NAS Glances API or service ports (`lib/data/repositories/nas_repository_impl.dart`).
5. **State Update:** BLoC emits `NasStatusState.loaded` with the new data.
6. **UI Rebuild:** `HomePage` (via `BlocBuilder`) rebuilds the dashboard (`lib/presentation/pages/home_page.dart`).

**State Management:**
- Handled by `flutter_bloc` using `Bloc` and `freezed` for immutable states and events.

## Key Abstractions

**Use Cases:**
- Purpose: Encapsulate a single business operation.
- Examples: `GetServicesStatusUseCase` in `lib/domain/usecases/get_services_status.dart`.
- Pattern: Command-like pattern executing a single method.

**Entities:**
- Purpose: Immutable data models for the domain.
- Examples: `HardwareInfo` in `lib/domain/entities/hardware_info.dart`.
- Pattern: Immutable data classes using `freezed`.

## Entry Points

**Main Function:**
- Location: `lib/main.dart`
- Triggers: Application startup.
- Responsibilities: Initializes `WidgetsFlutterBinding`, triggers Dependency Injection setup via `di.init()`, and runs the root `MaterialApp`.

## Architectural Constraints

- **Single Threaded:** Standard Dart event loop, but network requests use `Future` (async/await).
- **Dependency Injection:** Centralized in `lib/core/di/injection_container.dart` using `get_it`.
- **API Communication:** Restricted to the Data layer via `Dio`.

## Anti-Patterns

### Logic in Widgets

**What happens:** Placing business logic or direct API calls inside Widget build methods.
**Why it's wrong:** Makes testing difficult and violates Clean Architecture.
**Do this instead:** Dispatch an event to a BLoC and let the BLoC handle the logic.

## Error Handling

**Strategy:** BLoC-level catch blocks emitting specific Error states.

**Patterns:**
- Try-catch in BLoC handlers (`_onRefreshRequested`).
- UI shows `ErrorStateWidget` (`lib/presentation/widgets/error_state_widget.dart`) when BLoC state is `Error`.

## Cross-Cutting Concerns

**Logging:** Basic `print` statements used in repositories (could be improved to a logger).
**DI:** Managed by `GetIt` in `lib/core/di/injection_container.dart`.
**Theme:** Centralized in `lib/core/theme/app_theme.dart`.

---

*Architecture analysis: 2025-02-13*
