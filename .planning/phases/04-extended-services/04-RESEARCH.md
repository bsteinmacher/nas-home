# Phase 4: Support for Extended Services - Research

**Researched:** 2025-05-24
**Domain:** Media Management & Monitoring (Arr Stack)
**Confidence:** HIGH

## Summary

This phase focuses on integrating **Radarr** (Movies), **Sonarr** (TV Shows), and **Prowlarr** (Indexers) into the NAS Home App. These services belong to the same ecosystem as Lidarr and follow similar REST API patterns. The research confirms that the `NAS-Registry` backend already has placeholders for these services' API keys, but a synchronization bug exists in the Flutter client that must be addressed.

**Primary recommendation:** Implement monitoring-focused views for Radarr and Sonarr to track download progress and library status, while providing health status for Prowlarr indexers.

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| Library Monitoring | Client (Flutter) | API (Services) | Flutter fetches and displays state from Radarr/Sonarr. |
| API Key Discovery | Backend (Registry) | Client (Flutter) | Registry scans config files; Flutter syncs keys locally. |
| Media Requests | Client (Flutter) | API (Seerr) | Seerr remains the primary entry point for new requests. |
| Indexer Health | Client (Flutter) | API (Prowlarr) | Monitoring indexer status directly from Prowlarr. |

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Radarr API | v3 | Movie management | Standard for movie automation. |
| Sonarr API | v3 | TV show management | Standard for TV automation. |
| Prowlarr API | v1 | Indexer management | Standard for indexer proxying. |
| Freezed | ^2.4.0 | Data modeling | Used project-wide for immutable models. |
| BLoC | ^8.1.0 | State management | Architectural standard for this project. |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|--------------|
| Dio | ^5.4.0 | HTTP Client | For all external API calls. |
| GetIt | ^7.6.0 | Dependency Injection | To register new datasources/repositories. |

**Installation:**
```bash
# No new packages required. Existing stack covers all needs.
```

## Architecture Patterns

### Recommended Project Structure
```
lib/
├── data/
│   ├── datasources/
│   │   ├── radarr_datasource.dart
│   │   ├── sonarr_datasource.dart
│   │   └── prowlarr_datasource.dart
│   └── repositories/
│       ├── radarr_repository_impl.dart
│       ├── sonarr_repository_impl.dart
│       └── prowlarr_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── radarr.dart
│   │   ├── sonarr.dart
│   │   └── prowlarr.dart
│   └── repositories/
│       ├── radarr_repository.dart
│       ├── sonarr_repository.dart
│       └── prowlarr_repository.dart
└── presentation/
    ├── blocs/
    │   ├── radarr_bloc.dart
    │   ├── sonarr_bloc.dart
    │   └── prowlarr_bloc.dart
    └── pages/
        ├── radarr_page.dart
        ├── sonarr_page.dart
        └── prowlarr_page.dart
```

### Pattern 1: ServArr API Integration
All "Arr" services share a common API pattern using `X-Api-Key` headers and similar JSON structures for images and status.
**Example (Radarr Movie Lookup):**
```dart
// Source: [Verified via Radarr API v3 Docs]
final response = await dio.get(
  '$_baseUrl:7878/api/v3/movie/lookup',
  queryParameters: {'term': query},
  options: Options(headers: {'X-Api-Key': apiKey}),
);
```

### Anti-Patterns to Avoid
- **Duplicating Request Logic:** Don't build full "Request" UIs for Radarr/Sonarr if Seerr already handles it. Focus Radarr/Sonarr views on *monitoring* (what is already in the library or downloading).

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Image Caching | Custom Cache | `CachedNetworkImage` | Handles disk caching and error states efficiently. |
| Search Debouncing | Custom Timer | BLoC transform | `rxdart` or `stream_transform` on the Search event. |

## Common Pitfalls

### Pitfall 1: Registry Key Mismatch
**What goes wrong:** The `nas-registry` backend returns keys as `radarr_key`, `sonarr_key`, etc., but the Flutter `RegistryRepositoryImpl` currently looks for `radarr`, `sonarr`.
**How to avoid:** Update `RegistryRepositoryImpl` to check for both keys or align with the backend's Pydantic schema.

### Pitfall 2: Hardcoded Ports
**What goes wrong:** Using standard ports might fail if the user customized their NAS setup.
**How to avoid:** While currently hardcoded in `LidarrDataSource`, consider making these configurable or at least verifying them against `GEMINI.md` (Radarr: 7878, Sonarr: 8989, Prowlarr: 9696).

## Code Examples

### Radarr Movie Model (Freezed)
```typescript
// Based on Radarr API v3
@freezed
class RadarrMovie with _$RadarrMovie {
  const factory RadarrMovie({
    required int? id,
    required String title,
    required int year,
    required String status,
    required bool monitored,
    required int tmdbId,
    String? remotePoster,
    int? sizeOnDisk,
  }) = _RadarrMovie;
}
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Radarr v2 API | Radarr v3 API | 2021 | Improved JSON structure and better performance. |
| Sonarr v2 API | Sonarr v3 API | 2022 | Unified API pattern across the "Arr" family. |

## Assumptions Log

| # | Claim | Section | Risk if Wrong |
|---|-------|---------|---------------|
| A1 | Backend uses `_key` suffix for all keys | Common Pitfalls | Sync will fail if backend changes schema. |
| A2 | Users prefer Seerr for requests | UI Changes | App might lack "Request" buttons in Radarr/Sonarr. |

## Environment Availability

| Dependency | Required By | Available | Version | Fallback |
|------------|------------|-----------|---------|----------|
| Radarr | Movie monitoring | ✓ | v3+ (Assumed) | — |
| Sonarr | TV monitoring | ✓ | v3+ (Assumed) | — |
| Prowlarr | Indexer health | ✓ | v1+ (Assumed) | — |
| Registry | Key sync | ✓ | Phase 1/2 | Manual entry |

## Validation Architecture

### Test Framework
| Property | Value |
|----------|-------|
| Framework | Flutter Test |
| Quick run command | `flutter test` |

### Phase Requirements → Test Map
| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| REQ-01 | Sync Radarr/Sonarr/Prowlarr keys | unit | `flutter test test/data/repositories/registry_repository_test.dart` | ❌ Wave 0 |
| REQ-02 | Fetch Radarr movies | integration | `flutter test test/data/datasources/radarr_datasource_test.dart` | ❌ Wave 0 |

## Security Domain

### Applicable ASVS Categories

| ASVS Category | Applies | Standard Control |
|---------------|---------|-----------------|
| V5 Input Validation | yes | Sanitize search queries before sending to API. |
| V6 Cryptography | yes | SecureStorage for all API Keys. |

## Sources

### Primary (HIGH confidence)
- `GEMINI.md` - Port configurations and service list.
- `services/registry/app/schemas.py` - Backend key names.
- `lib/data/repositories/registry_repository_impl.dart` - Current sync logic.

### Secondary (MEDIUM confidence)
- Radarr/Sonarr API Documentation (Web Search) - API endpoints.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Follows existing project patterns.
- Architecture: HIGH - Mapped to existing BLoC/Clean Architecture.
- Pitfalls: MEDIUM - Identifies a specific existing bug.

**Research date:** 2025-05-24
**Valid until:** 2025-06-24
