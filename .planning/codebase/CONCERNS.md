# Codebase Concerns

**Analysis Date:** 2025-02-14

## Tech Debt

**Hardcoded Service List:**
- Issue: The list of NAS services is hardcoded in the repository implementation, making it difficult to add or remove services without modifying code.
- Files: `lib/data/repositories/nas_repository_impl.dart`
- Impact: Increased maintenance effort and lack of flexibility for different NAS setups.
- Fix approach: Fetch the service list from a configuration file or the "Nas Registry" API.

**Hardcoded Infrastructure Details:**
- Issue: Network interface names (`enp2s0`) and mount points (`/`, `/home/didizera/meu-nas/data`) are hardcoded.
- Files: `lib/data/repositories/nas_repository_impl.dart`
- Impact: The application will fail to display hardware info on any machine with different hardware or disk layout.
- Fix approach: Make these parameters configurable in settings or auto-detect them via the Glances API.

**Hardcoded Service Ports:**
- Issue: Ports for all services (Seerr, Lidarr, etc.) are hardcoded in multiple places.
- Files: `lib/data/repositories/nas_repository_impl.dart`, `lib/data/datasources/lidarr_datasource.dart`, `lib/data/datasources/seerr_datasource.dart`, `lib/data/datasources/registry_datasource.dart`
- Impact: If a service is moved to a different port (e.g., due to a conflict), the app breaks.
- Fix approach: Store service ports in `SharedPreferences` and allow them to be synced from the Registry.

**Duplicate URL Normalization:**
- Issue: Logic for cleaning and formatting the NAS base URL is duplicated across several classes.
- Files: `lib/data/repositories/nas_repository_impl.dart`, `lib/data/repositories/registry_repository_impl.dart`, `lib/data/datasources/lidarr_datasource.dart`, `lib/data/datasources/seerr_datasource.dart`
- Impact: Inconsistent behavior if the normalization logic needs to change.
- Fix approach: Extract URL normalization to a central utility class or an extension on `String`.

## Known Bugs

**Service Port Inconsistency:**
- Issue: `AdGuard Home` port is listed as `8085` in the code, but documentation (`GEMINI.md`) says `53/3000`.
- Files: `lib/data/repositories/nas_repository_impl.dart`
- Symptoms: AdGuard Home might appear offline if it's actually running on port 3000.
- Trigger: Checking service status on a default NAS installation.

**Inconsistent Localization:**
- Issue: Error messages are mostly in English, but one critical error is in Portuguese.
- Files: `lib/presentation/blocs/nas_status_bloc.dart`
- Symptoms: "Configure a URL do NAS nas configurações." displayed to users instead of an English message.
- Fix approach: Standardize all user-facing strings to one language or implement a proper localization system (i18n).

## Performance Bottlenecks

**Sequential Service Checks:**
- Issue: Service status is checked by making individual HTTP requests.
- Files: `lib/data/repositories/nas_repository_impl.dart`, `lib/domain/usecases/get_services_status.dart`
- Cause: While `Future.wait` is used in the Bloc, the repository performs status checks that might be slow if many services are offline (hitting timeouts).
- Improvement path: Optimize timeouts (already 2s) and ensure parallel execution at the lowest level possible.

## Fragile Areas

**Glances API Dependency:**
- Issue: Hardware monitoring depends entirely on Glances (port 61208) being active and using API version 4.
- Files: `lib/data/repositories/nas_repository_impl.dart`
- Why fragile: If Glances is disabled or updated to a version with a different API schema, all hardware stats will disappear (showing "OFFLINE").
- Safe modification: Add version check or fallback mechanisms for hardware stats.

**Navidrome/Lidarr Mapping:**
- Issue: Navidrome service is mapped to `LidarrPage`.
- Files: `lib/presentation/widgets/active_services_list.dart`
- Why fragile: Confusing UX where clicking a music player service leads to a music management/request interface.
- Safe modification: Create a separate Navidrome view or clarify the link in the UI.

## Test Coverage Gaps

**Missing Unit Tests:**
- What's not tested: Repository logic, URL normalization, and Bloc state transitions.
- Files: All files under `lib/` except those verified by `widget_test.dart`.
- Risk: Regressions in URL parsing or status checking logic could go unnoticed.
- Priority: Medium

**Missing Integration Tests:**
- What's not tested: End-to-end flow from configuration to service discovery.
- Risk: The "Sync from Registry" feature is complex and depends on specific API responses; changes to the Registry could break the app.
- Priority: High

---

*Concerns audit: 2025-02-14*
