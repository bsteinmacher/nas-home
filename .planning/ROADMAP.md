# Project Roadmap - NAS Home

## Phases

- [x] **Phase 1: NAS Registry Microservice Core** - Build the Python/FastAPI discovery service.
- [x] **Phase 2: Deployment & Infrastructure** - Dockerize and deploy to NAS with reverse proxy.
- [x] **Phase 3: App Integration & UI Refinement** - Finalize Flutter integration and sync UX.
- [x] **Phase 4: Support for Extended Services** - Add Radarr, Sonarr, and Prowlarr monitoring to the App.
- [ ] **Phase 5: Unified Service Dashboard** - Refactor to "Service Card" model for all services.

## Phase Details

### Phase 1: NAS Registry Microservice Core
**Goal**: Create a lightweight service that extracts API keys from NAS service configurations.
**Depends on**: Nothing
**Requirements**: [NAS-REG-01, NAS-REG-02, NAS-REG-03, NAS-REG-04, NAS-REG-05]
**Success Criteria** (what must be TRUE):
  1. Service starts and listens on port 8000.
  2. `GET /config` returns 401/403 without a valid `X-Registry-Token`.
  3. `GET /config` with valid token returns a JSON containing keys for at least Lidarr and Seerr (mocked or real).
  4. Unit tests verify XML and JSON parsing for various service config formats.
**Plans**: 2 plans
- [x] 01-01-PLAN.md — Setup project environment, FastAPI skeleton, and X-Registry-Token security.
- [x] 01-02-PLAN.md — Implement XML/JSON scanning logic and expose via the /config endpoint.

### Phase 2: Deployment & Infrastructure
**Goal**: Make the Registry service accessible to the mobile app securely.
**Depends on**: Phase 1
**Requirements**: [NAS-REG-06, NAS-REG-07, NAS-INF-01, NAS-INF-02, NAS-INF-03]
**Success Criteria** (what must be TRUE):
  1. Docker image is built and running on the NAS.
  2. Registry service can access read-only config files of other services via Docker volumes.
  3. `registry.meunas.home` is reachable from the local network via HTTPS/HTTP.
  4. Real API keys are correctly extracted from the actual NAS configuration files.
**Plans**: 1 plan
- [x] 02-01-PLAN.md — Dockerize and deploy the NAS Registry service to the remote NAS host.

### Phase 3: App Integration & UI Refinement
**Goal**: Seamlessly sync the mobile app with the NAS Registry.
**Depends on**: Phase 2
**Requirements**: [APP-REG-01, APP-REG-02, APP-REG-03, APP-REG-04]
**Success Criteria** (what must be TRUE):
  1. User can enter NAS URL and Token in the Settings page.
  2. Clicking "Run Auto Discovery Sync" successfully fetches and saves keys.
  3. App UI reflects updated status (e.g., Lidarr page starts working if it was missing the key).
  4. Error handling gracefully manages network issues or invalid tokens.
**Plans**: 3 plans
- [x] 03-01-PLAN.md — Setup Secure Storage infrastructure and DI.
- [x] 03-02-PLAN.md — Update Repository and DataSources to use Secure Storage.
- [x] 03-03-PLAN.md — Refine Settings UI and finalize end-to-end sync workflow.

### Phase 4: Support for Extended Services
**Goal**: Expand the App to support the full media stack monitoring.
**Depends on**: Phase 3
**Requirements**: [APP-EXT-01, APP-EXT-02, APP-EXT-03, APP-EXT-04]
**Success Criteria** (what must be TRUE):
  1. App includes pages/tabs for Radarr and Sonarr.
  2. Service status indicators show health for all services in the Registry.
  3. Navigation between different media modules is fluid.
**Plans**: 4 plans
- [x] 04-01-PLAN.md — Fix Registry sync bug and define shared entities.
- [x] 04-02-PLAN.md — Implement Radarr data layer, BLoC, and monitoring page.
- [x] 04-03-PLAN.md — Implement Sonarr data layer, BLoC, and monitoring page.
- [x] 04-04-PLAN.md — Integrate Prowlarr health checks and finalize dashboard UI.

### Phase 5: Unified Service Dashboard
**Goal**: Consolidate all NAS services into a unified "Service Card" UI with integrated health monitoring.
**Depends on**: Phase 4
**Requirements**: [APP-DASH-01, APP-DASH-02, APP-DASH-03, APP-DASH-04, APP-DASH-05]
**Success Criteria** (what must be TRUE):
  1. Every NAS service (Jellyfin, Navidrome, qBittorrent, etc.) has a dedicated card on the dashboard.
  2. Each card displays the real-time online/offline status of the service.
  3. The redundant "Service Status" list is removed from the UI.
  4. Cards are clickable, leading to the service's internal page or opening its web UI.
**Plans**: 3 plans
- [ ] 05-01-PLAN.md — Refactor NasService and NasRepository to support container metrics.
- [ ] 05-02-PLAN.md — Implement ServiceCard and ServiceGrid UI components.
- [ ] 05-03-PLAN.md — Assemble the new Dashboard on HomePage and cleanup legacy components.

## Progress Table

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. NAS Registry Microservice Core | 2/2 | Completed | 2026-05-04 |
| 2. Deployment & Infrastructure | 1/1 | Completed | 2026-05-04 |
| 3. App Integration & UI Refinement | 3/3 | Completed | 2026-05-04 |
| 4. Support for Extended Services | 4/4 | Completed | 2026-05-20 |
| 5. Unified Service Dashboard | 0/3 | In Progress | - |
