# Requirements

## v1: Magia Automática (NAS Registry)

### NAS Registry Microservice (Backend)
- **NAS-REG-01**: Microservice built with Python and FastAPI for high performance and low resource usage.
- **NAS-REG-02**: Automatic discovery of API keys from service configuration files (Lidarr, Radarr, Sonarr, Seerr, Prowlarr).
- **NAS-REG-03**: Support reading XML (Lidarr/Radarr/Sonarr) and JSON (Seerr/Prowlarr) config formats.
- **NAS-REG-04**: REST API endpoint `GET /config` that returns all discovered keys in a structured JSON.
- **NAS-REG-05**: Security implementation using a custom header `X-Registry-Token`.
- **NAS-REG-06**: Dockerization of the microservice for easy deployment on the NAS.
- **NAS-REG-07**: Documentation of the environment variables required for configuration file paths.

### Infrastructure & Deployment
- **NAS-INF-01**: Docker Compose integration with the existing NAS media stack.
- **NAS-INF-02**: Reverse proxy configuration via Nginx Proxy Manager (NPM) for `registry.meunas.home`.
- **NAS-INF-03**: Secure communication between the App and the Registry service.

### Flutter App Integration (Frontend)
- **APP-REG-01**: Settings UI to input the Registry Token and NAS URL.
- **APP-REG-02**: Automatic synchronization logic that fetches keys and updates `SharedPreferences`.
- **APP-REG-03**: Visual feedback (Loading states, Success/Error notifications) during the sync process.
- **APP-REG-04**: Deprecation of manual API key entry in favor of the auto-discovery service.

## v2: Unified Dashboard (gsd-02)

### Service Card Model
- **APP-DASH-01**: Implement a generic "Service Card" component that displays service name, icon, and status.
- **APP-DASH-02**: Integrate real-time health status (online/offline) directly into each Service Card.
- **APP-DASH-03**: Refactor the Dashboard to display a grid/list of Service Cards for all configured NAS services.
- **APP-DASH-04**: Remove the legacy "Service Status" list to eliminate redundancy.
- **APP-DASH-05**: Ensure Service Cards provide quick actions (e.g., open service UI, deep link to internal page).

## Traceability

| Requirement | Phase | Status |
|-------------|-------|--------|
| NAS-REG-01  | Phase 1 | Completed |
| NAS-REG-02  | Phase 1 | Completed |
| NAS-REG-03  | Phase 1 | Completed |
| NAS-REG-04  | Phase 1 | Completed |
| NAS-REG-05  | Phase 1 | Completed |
| NAS-REG-06  | Phase 2 | Completed |
| NAS-REG-07  | Phase 2 | Completed |
| NAS-INF-01  | Phase 2 | Completed |
| NAS-INF-02  | Phase 2 | Completed |
| NAS-INF-03  | Phase 2 | Completed |
| APP-REG-01  | Phase 3 | Completed |
| APP-REG-02  | Phase 3 | Completed |
| APP-REG-03  | Phase 3 | Completed |
| APP-REG-04  | Phase 3 | Completed |
| APP-DASH-01 | Phase 5 | Pending |
| APP-DASH-02 | Phase 5 | Pending |
| APP-DASH-03 | Phase 5 | Pending |
| APP-DASH-04 | Phase 5 | Pending |
| APP-DASH-05 | Phase 5 | Pending |
