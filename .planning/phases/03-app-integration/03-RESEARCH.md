# Phase 3: App Integration & UI Refinement - Research

**Researched:** 2026-05-04
**Domain:** Flutter / App Sync / Security
**Confidence:** HIGH

## Summary
The Flutter app already has a foundational implementation for syncing with the NAS Registry. A `RegistryDataSource` and `RegistryRepository` exist, and the `SettingsPage` includes UI for the NAS URL, Registry Token, and a sync button. However, sensitive data (Registry Token and API Keys) is currently stored in plain text using `shared_preferences`.

**Primary recommendation:** Migrate sensitive storage to `flutter_secure_storage` and update the DataSources to read from this secure layer to ensure the "Seamless Sync" is also a "Secure Sync".

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| Config Discovery | App (Repository) | NAS Registry | App initiates the request; Registry provides the mapping. |
| Credential Storage | App (Secure Storage) | — | Must be local to the device and encrypted at rest. |
| API Key Injection | App (Data Sources) | BLoCs | Data sources retrieve keys from storage on-demand for API calls. |

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| flutter_secure_storage | ^9.2.2 | Encrypted storage | Industry standard for tokens/keys on iOS/Android. |
| shared_preferences | ^2.3.2 | Non-sensitive settings | Used for NAS URL and UI preferences. |
| dio | ^5.9.0 | HTTP Client | Standard for Flutter API integrations. |
| get_it | ^7.7.0 | Dependency Injection | Existing DI framework in the project. |

## Architecture Patterns

### Recommended Project Structure
- `lib/core/storage/`: New directory for a `SecureStorageService` abstraction.
- `lib/data/repositories/registry_repository_impl.dart`: Update to save keys to secure storage.
- `lib/data/datasources/*_datasource.dart`: Update to read keys from secure storage.

### Sync Pattern
1. User triggers sync in `SettingsPage`.
2. `SyncRegistryConfigUseCase` calls `RegistryRepository`.
3. Repository fetches JSON from Registry.
4. Repository persists keys in `FlutterSecureStorage`.
5. BLoCs read the fresh keys from storage.

## Common Pitfalls

### Pitfall 1: Plain-text API Keys
**What goes wrong:** `shared_preferences` stores data in XML/Plist files that are readable on rooted devices.
**How to avoid:** Use `flutter_secure_storage` for any value used in an `X-Api-Key`.

### Pitfall 2: Stale BLoC State
**What goes wrong:** BLoC caches an API key in a local variable, not seeing the new key after sync.
**How to avoid:** Data sources should read the key from storage per request, or BLoCs must refresh.