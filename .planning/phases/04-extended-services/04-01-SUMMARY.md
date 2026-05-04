# Phase 4 Plan 1: Extended Services Foundation Summary

## substantive one-liner
Fixed Registry API key synchronization logic and defined data entities for Radarr, Sonarr, and Prowlarr services.

## Key Changes

### Registry Synchronization Fix
- Modified `RegistryRepositoryImpl.syncConfig` to support keys with and without the `_key` suffix (e.g., `radarr` vs `radarr_key`).
- This ensures compatibility with the `nas-registry` backend's Pydantic schema while maintaining backward compatibility.
- Updated mappings for Radarr, Sonarr, Prowlarr, Lidarr, and Seerr.

### New Service Entities
- Defined `RadarrMovie`, `SonarrSeries`, and `ProwlarrIndexer` using `freezed` for immutable data structures and type-safe JSON serialization.
- Generated necessary `.freezed.dart` and `.g.dart` files using `build_runner`.

### Testing & Quality
- Created `test/data/repositories/registry_repository_test.dart` to verify the new synchronization logic.
- Added `mocktail` as a development dependency for mocking in tests.
- All unit tests passed.

## Deviations from Plan
- **Rule 3 - Missing Test File:** The plan mentioned running `test/data/repositories/registry_repository_test.dart`, but it did not exist. I created it to ensure proper verification of the fix.
- **Dependency Addition:** Added `mocktail` to `pubspec.yaml` to support the new unit tests.

## Known Stubs
None.

## Self-Check: PASSED
- [x] `lib/data/repositories/registry_repository_impl.dart` modified and tested.
- [x] `lib/domain/entities/radarr.dart`, `sonarr.dart`, and `prowlarr.dart` created.
- [x] `build_runner` successfully generated files.
- [x] Commits made for each task.
