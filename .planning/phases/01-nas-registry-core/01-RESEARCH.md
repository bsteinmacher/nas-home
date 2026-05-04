# Phase 1: NAS Registry Core - Research

**Researched:** 2025-01-24
**Domain:** Python/FastAPI Discovery Service
**Confidence:** HIGH

## Summary

The NAS Registry is a specialized microservice designed to run within the NAS environment. Its core responsibility is to scan the configuration files of various media services (Lidarr, Radarr, Sonarr, Seerr, Prowlarr) and extract their API keys. This "discovery" approach allows the companion Flutter application to synchronize all necessary credentials using a single shared secret (the `X-Registry-Token`), significantly improving user experience by eliminating manual token entry for each service.

**Primary recommendation:** Implement a FastAPI service that uses `xml.etree.ElementTree` for parsing *Arr service configs and the standard `json` library for Seerr/Jellyseerr. Use `fastapi.security.APIKeyHeader` to enforce the `X-Registry-Token` security requirement.

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| API Key Extraction | Backend (Python) | — | Needs direct filesystem access to config files. |
| Security (Token Auth) | Backend (Python) | — | Protects sensitive API keys from unauthorized access. |
| Config Sync | Client (Flutter) | Backend (Python) | Client triggers sync and stores keys locally. |

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| FastAPI | 0.115.6 | Web Framework | Modern, high performance, native async support, and excellent type safety. [VERIFIED: pypi.org] |
| Uvicorn | 0.34.0 | ASGI Server | Lightning-fast implementation for Python. [VERIFIED: uvicorn.run] |
| Pydantic | 2.10.x | Data Validation | Industry standard for data parsing and settings management in Python. [VERIFIED: pypi.org] |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|--------------|
| python-dotenv | 1.0.1 | Env Management | Loading configuration file paths and the Registry Token from a `.env` file. |
| lxml | 5.3.0 | XML Parsing | Optional alternative to ElementTree if complex XPath queries are needed (though ElementTree is sufficient for current needs). |

**Installation:**
```bash
pip install "fastapi[standard]" python-dotenv
```

## Architecture Patterns

### Recommended Project Structure
```
registry/
├── app/
│   ├── main.py          # FastAPI entry point & routes
│   ├── security.py      # X-Registry-Token implementation
│   ├── scanner.py       # Logic for reading XML/JSON files
│   └── schemas.py       # Pydantic models for response
├── .env                 # Environment variables (Paths, Token)
├── Dockerfile           # To be built in Phase 2
└── requirements.txt     # Dependencies
```

### Pattern 1: Servarr Config Discovery (XML)
**What:** Reading the `<ApiKey>` tag from the `<Config>` root in `config.xml`.
**When to use:** For Lidarr, Radarr, Sonarr, and Prowlarr.
**Example:**
```python
import xml.etree.ElementTree as ET

def get_servarr_key(file_path: str) -> str:
    tree = ET.parse(file_path)
    root = tree.getroot()
    return root.findtext('ApiKey')
```

### Pattern 2: Seerr Config Discovery (JSON)
**What:** Reading the `apiKey` field from the root of `settings.json`.
**When to use:** For Overseerr and Jellyseerr.
**Example:**
```python
import json

def get_seerr_key(file_path: str) -> str:
    with open(file_path, 'r') as f:
        data = json.load(f)
    return data.get('apiKey')
```

### Anti-Patterns to Avoid
- **Hardcoding Paths:** Never hardcode paths like `/config/lidarr/config.xml`. Use environment variables so the Docker container can be remapped easily.
- **Plain String Comparison for Tokens:** Avoid `token == VALID_TOKEN`. Use `secrets.compare_digest` to prevent timing attacks.

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Auth Headers | Custom Middleware | `APIKeyHeader` | Built-in FastAPI support with Swagger UI integration. |
| XML Parsing | Regex | `ElementTree` | XML structure can vary; regex is fragile for nested tags. |
| Settings | `os.environ` | `Pydantic Settings` | Provides validation and type hints for configuration. |

## Common Pitfalls

### Pitfall 1: File Permission Denied
**What goes wrong:** The Registry service starts but returns 500 errors or empty keys because it cannot read the mapped config files.
**Why it happens:** The files are owned by specific users (e.g., `abc` in LinuxServer.io images) and the Registry container runs as root or a different user.
**How to avoid:** Ensure the Registry container runs with appropriate PUID/PGID or that volumes are mounted with read permissions for the Registry user.

### Pitfall 2: Discrepancy in Prowlarr Format
**What goes wrong:** Attempting to parse Prowlarr as JSON (as suggested in some requirements) fails.
**Why it happens:** Prowlarr is part of the Servarr family and uses XML for its core `config.xml`, even though its API uses JSON. [VERIFIED: Official Docs]
**How to avoid:** Treat Prowlarr as an XML source, same as Sonarr/Radarr.

## Code Examples

### FastAPI X-Registry-Token Security
```python
# Source: FastAPI Official Documentation (Security - First Steps)
from fastapi import Security, HTTPException, status
from fastapi.security import APIKeyHeader
import secrets

api_key_header = APIKeyHeader(name="X-Registry-Token", auto_error=True)
REGISTRY_TOKEN = "your-shared-secret-here"

def validate_token(token: str = Security(api_key_header)):
    if not secrets.compare_digest(token, REGISTRY_TOKEN):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Invalid Registry Token"
        )
    return token
```

## Phase Requirements

| ID | Description | Research Support |
|----|-------------|------------------|
| NAS-REG-01 | Python/FastAPI microservice | Selected FastAPI 0.115.6 + Uvicorn. |
| NAS-REG-02 | Auto-discovery of keys | Identified config locations and XML/JSON tags. |
| NAS-REG-03 | XML/JSON Support | `ElementTree` for XML, `json` for JSON confirmed. |
| NAS-REG-04 | `GET /config` endpoint | Response structure mapped to Dart client expectations. |
| NAS-REG-05 | `X-Registry-Token` | Implemented via `APIKeyHeader`. |

## Environment Availability

| Dependency | Required By | Available | Version | Fallback |
|------------|------------|-----------|---------|----------|
| Python 3.12+ | Runtime | ✗ | — | Install via Docker (Phase 2) |
| Docker | Deployment | ✓ | 27.x | — |

## Validation Architecture

### Test Framework
| Property | Value |
|----------|-------|
| Framework | pytest |
| Config file | pytest.ini |
| Quick run command | `pytest` |

### Phase Requirements → Test Map
| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| NAS-REG-02 | Key discovery | Unit | `pytest tests/test_scanner.py` | ❌ Wave 0 |
| NAS-REG-05 | Token Security | Integration | `pytest tests/test_auth.py` | ❌ Wave 0 |

## Security Domain

### Applicable ASVS Categories

| ASVS Category | Applies | Standard Control |
|---------------|---------|-----------------|
| V5 Input Validation | yes | Pydantic models for configuration paths. |
| V6 Cryptography | yes | `secrets.compare_digest` for token comparison. |

### Known Threat Patterns for FastAPI

| Pattern | STRIDE | Standard Mitigation |
|---------|--------|---------------------|
| Token Leakage | Information Disclosure | Use HTTPS (handled by Nginx Proxy Manager). |
| Timing Attack | Tampering | Use constant-time comparison for tokens. |

## Sources

### Primary (HIGH confidence)
- `tiangolo.com/fastapi` - FastAPI documentation and security patterns.
- `wiki.servarr.com` - Configuration structures for Lidarr, Radarr, Sonarr.
- `docs.overseerr.dev` - Configuration structure for Overseerr/Seerr.

### Secondary (MEDIUM confidence)
- Community forums (Reddit/GitHub) - Prowlarr config file verification.

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - Current 2024/2025 industry standards.
- Architecture: HIGH - Matches existing Dart client expectations.
- Pitfalls: MEDIUM - Depends on actual NAS filesystem permissions.

**Research date:** 2025-01-24
**Valid until:** 2025-07-24
