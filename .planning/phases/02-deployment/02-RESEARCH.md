# Phase 2: Deployment & Infrastructure - Research

**Researched:** 2025-02-14
**Domain:** DevOps / Docker / Networking
**Confidence:** HIGH

## Summary

This phase focuses on the containerization and deployment of the `nas-registry` service. The goal is to ensure the service runs reliably on the NAS, can securely access the configuration files of other services (Lidarr, Seerr, etc.), and is accessible via a user-friendly local domain (`registry.meunas.home`) through Nginx Proxy Manager.

**Primary recommendation:** Use a multi-stage Docker build based on `python:3.12-slim` to minimize image size and security surface area, and deploy via Docker Compose joining the existing `proxynet` external network.

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|------------------|
| NAS-REG-06 | Dockerization of the microservice for easy deployment on the NAS. | Optimized multi-stage Dockerfile provided. |
| NAS-REG-07 | Documentation of the environment variables required for configuration file paths. | Detailed `docker-compose.yaml` and `.env` mapping included. |
| NAS-INF-01 | Docker Compose integration with the existing NAS media stack. | Snippet joins `proxynet` and mounts media config volumes. |
| NAS-INF-02 | Reverse proxy configuration via Nginx Proxy Manager (NPM) for `registry.meunas.home`. | Pattern and steps for NPM configuration documented. |
| NAS-INF-03 | Secure communication between the App and the Registry service. | Reverse proxy integration enables HTTPS and header-based auth. |
</phase_requirements>

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| Containerization | Docker | — | Provides isolation and reproducible environment. |
| Service Orchestration | Docker Compose | — | Manages environment variables, networks, and volumes. |
| Reverse Proxy | Nginx Proxy Manager | — | Handles SSL, domain mapping, and traffic routing. |
| Configuration Access | Docker Volumes | — | Allows read-only access to files owned by other containers. |
| DNS Resolution | AdGuard Home | — | (Assumed) Resolves `.home` domains to the NAS IP. |

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Docker | 24.0.7+ | Containerization | Industry standard for service isolation. |
| Docker Compose | 2.21.0+ | Orchestration | Simplifies multi-container management. |
| FastAPI | 0.115.x | Web Framework | High performance, automatic OpenAPI docs. |
| Uvicorn | 0.30.x | ASGI Server | Standard, fast production server for FastAPI. |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|--------------|
| python-slim | 3.12 | Base Image | Best balance of size and compatibility. |
| NPM | Latest | Reverse Proxy | User-friendly GUI for Nginx management. |

**Installation:**
The service is deployed via Docker, so no local `pip install` is required on the NAS host.

## Architecture Patterns

### System Architecture Diagram

```
[ Mobile App ] 
      |
      v (HTTPS/HTTP)
[ Nginx Proxy Manager (NPM) ] 
      | (Proxynet)
      v (Port 8000)
[ NAS Registry Service ]
      | (RO Volume Mounts)
      +--> [ Lidarr Config ]
      +--> [ Radarr Config ]
      +--> [ Sonarr Config ]
      +--> [ Seerr Config ]
```

### Recommended Project Structure
```
services/registry/
├── Dockerfile           # Multi-stage build
├── docker-compose.yaml  # Deployment config
├── .env.example         # Template for secrets
├── app/                 # FastAPI source code
└── pyproject.toml       # Dependencies
```

### Pattern 1: Multi-stage Docker Build
Separates build dependencies (like `gcc`) from the final runtime image to keep it lightweight.

### Pattern 2: Read-Only Volume Sidecar
The Registry service acts as a "sidecar-like" observer, mounting configuration directories of other services as read-only (`:ro`) to extract API keys without risk of data corruption.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Reverse Proxy | Custom Nginx config | Nginx Proxy Manager | Easier management, GUI for SSL/Domains. |
| Auth Security | Custom Crypto | `secrets.compare_digest` | Prevents timing attacks. |
| App Server | Custom Socket | Uvicorn | Optimized for performance and spec compliance. |

## Environment Availability

| Dependency | Required By | Available | Version | Fallback |
|------------|------------|-----------|---------|----------|
| Docker | All | ✓ | (Verified via GEMINI.md) | — |
| Docker Compose | All | ✓ | (Verified via GEMINI.md) | — |
| Nginx Proxy Manager | Reverse Proxy | ✓ | (Verified via GEMINI.md) | — |
| proxynet (network) | Connectivity | ✓ | (Verified via GEMINI.md) | — |

## Common Pitfalls

### Pitfall 1: Volume Permissions
**What goes wrong:** The container cannot read the mounted files (Lidarr/Seerr config).
**Why it happens:** Files on the host are owned by a different user/UID.
**How to avoid:** Ensure the files have group-read or other-read permissions on the host, or run the container with the same GID as the media services.
**Warning signs:** `Permission Denied` in container logs.

### Pitfall 2: Missing Proxy Headers
**What goes wrong:** `X-Forwarded-For` or `X-Real-IP` are not correctly detected.
**Why it happens:** Uvicorn is not told to trust the proxy.
**How to avoid:** Use the `--proxy-headers` flag and `--forwarded-allow-ips='*'` (if safe).

## Code Examples

### Optimized Dockerfile
```dockerfile
# Stage 1: Builder
FROM python:3.12-slim AS builder
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml .
RUN pip install --no-cache-dir --prefix=/install .

# Stage 2: Runtime
FROM python:3.12-slim
WORKDIR /app

COPY --from=builder /install /usr/local
COPY app/ /app/app/

RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

EXPOSE 8000
# --proxy-headers is critical for NPM integration
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers"]
```

### Docker Compose Snippet
```yaml
services:
  nas-registry:
    build: .
    container_name: nas-registry
    restart: unless-stopped
    networks:
      - proxynet
    environment:
      - REGISTRY_TOKEN=${REGISTRY_TOKEN}
      - LIDARR_CONFIG_PATH=/config/lidarr/config.xml
      - RADARR_CONFIG_PATH=/config/radarr/config.xml
      - SONARR_CONFIG_PATH=/config/sonarr/config.xml
      - PROWLARR_CONFIG_PATH=/config/prowlarr/config.xml
      - SEERR_SETTINGS_PATH=/config/seerr/settings.json
    volumes:
      # Paths verified from .env.example hints and GEMINI.md
      - /home/didizera/meu-nas/data/config/lidarr:/config/lidarr:ro
      - /home/didizera/meu-nas/data/config/radarr:/config/radarr:ro
      - /home/didizera/meu-nas/data/config/sonarr:/config/sonarr:ro
      - /home/didizera/meu-nas/data/config/prowlarr:/config/prowlarr:ro
      - /home/didizera/meu-nas/data/config/seerr:/config/seerr:ro

networks:
  proxynet:
    external: true
```

## Security Domain

### Applicable ASVS Categories

| ASVS Category | Applies | Standard Control |
|---------------|---------|-----------------|
| V2 Authentication | Yes | `X-Registry-Token` Header Validation |
| V4 Access Control | Yes | Endpoint protection via `Depends(validate_token)` |
| V5 Input Validation | Yes | Pydantic Schema enforcement |
| V14 Configuration | Yes | Secure storage of `REGISTRY_TOKEN` in `.env` |

### Known Threat Patterns for FastAPI/Docker

| Pattern | STRIDE | Standard Mitigation |
|---------|--------|---------------------|
| Token Brute Force | Information Disclosure | Rate limiting (optional) or complex token |
| Container Breakout | Elevation of Privilege | Run as non-root user (`appuser`) |
| Config Tampering | Tampering | Read-only volume mounts (`:ro`) |

## Sources

### Primary (HIGH confidence)
- `GEMINI.md` - Verified NAS paths and network configuration.
- `services/registry/.env.example` - Verified expected config file paths.
- Official FastAPI/Uvicorn Docs - Verified Docker deployment best practices.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH
- Architecture: HIGH
- Pitfalls: MEDIUM (Volume permissions often need host-side adjustment)

**Research date:** 2025-02-14
**Valid until:** 2025-05-14
