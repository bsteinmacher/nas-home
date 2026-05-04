# External Integrations

**Analysis Date:** 2025-02-13

## APIs & External Services

**Media Management:**
- Lidarr - Music management and automation.
  - SDK/Client: `lib/data/datasources/lidarr_datasource.dart`
  - Auth: `lidarr_api_key` (Shared Preferences), sent via `X-Api-Key` header.
  - Port: 8686
- Seerr (Overseerr/Jellyseerr) - Media request management.
  - SDK/Client: `lib/data/datasources/seerr_datasource.dart`
  - Auth: `seerr_api_key` (Shared Preferences), sent via `X-Api-Key` header.
  - Port: 5055

**Monitoring & Infrastructure:**
- Glances - System-wide hardware monitoring.
  - Client: `lib/data/repositories/nas_repository_impl.dart`
  - Auth: None (Internal access)
  - Port: 61208 (REST API v4)
- Nas Registry - Custom configuration discovery service.
  - SDK/Client: `lib/data/datasources/registry_datasource.dart`
  - Auth: `registry_token` (Shared Preferences), sent via `X-Registry-Token` header.
  - Port: 8000

**Service Status Monitoring:**
- Generic HTTP status checks performed on multiple NAS services:
  - Nginx Proxy Manager (Port 81)
  - AdGuard Home (Port 8085)
  - Vaultwarden (Port 80)
  - Jellyfin (Port 8096)
  - Navidrome (Port 4533)
  - qBittorrent (Port 8080)
  - Radarr (Port 7878)
  - Sonarr (Port 8989)
  - Prowlarr (Port 9696)
  - Bazarr (Port 6767)
  - Tdarr (Port 8265)
  - Immich (Port 2283)
  - Nextcloud (Port 8080)

## Data Storage

**Databases:**
- Not directly accessed by the Flutter app. Handled by backend services (e.g., Postgres for Immich, SQLite for Arr services).

**Local Storage:**
- `shared_preferences` - Stores application settings, API keys, and the base NAS URL.

**File Storage:**
- Accesses media metadata and artwork via service APIs (Lidarr, Seerr).

## Authentication & Identity

**Auth Provider:**
- API Key based authentication for internal services.
- The app requires a `nas_url` and specific API keys to be configured in the Settings page.

## Monitoring & Observability

**Error Tracking:**
- None (currently using `print` statements in repositories).

**Logs:**
- Console-based logging for debug and error information in `lib/data/repositories/nas_repository_impl.dart`.

## CI/CD & Deployment

**Hosting:**
- Self-hosted on Arch Linux NAS (IP: 192.168.100.85).

**VPN:**
- Headscale (WireGuard-based) for remote access.

## Environment Configuration

**Required env vars (App Persistence):**
- `nas_url`: Base URL/IP of the NAS.
- `lidarr_api_key`: API key for Lidarr.
- `seerr_api_key`: API key for Seerr.
- `registry_token`: Access token for the Nas Registry.

**Secrets location:**
- Stored securely in the device's local storage via `SharedPreferences`.

---

*Integration audit: 2025-02-13*
