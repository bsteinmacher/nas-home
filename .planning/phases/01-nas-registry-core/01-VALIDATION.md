# Phase 1: NAS Registry Core - Validation

## Test Expectations

### 1. Foundational Environment
- **Requirement:** The project must have a standard Python structure with managed dependencies.
- **Verification:**
    - `services/registry/pyproject.toml` exists and lists `fastapi`, `uvicorn`, `pydantic-settings`, and `python-dotenv`.
    - `services/registry/.env.example` exists with all required keys.
    - A virtual environment can be created and dependencies installed via the specified tool (e.g., `pip install .` or similar).

### 2. Security (Token Authentication)
- **Requirement:** Access to sensitive configuration data must be protected by the `X-Registry-Token` header.
- **Verification:**
    - `GET /config` without the `X-Registry-Token` header MUST return `403 Forbidden`.
    - `GET /config` with an incorrect `X-Registry-Token` header MUST return `403 Forbidden`.
    - `GET /config` with a valid `X-Registry-Token` matching the `REGISTRY_TOKEN` environment variable MUST return `200 OK`.
    - Automated tests in `services/registry/tests/test_auth.py` must pass.

### 3. Key Discovery Logic
- **Requirement:** The service must accurately extract API keys from XML (*Arr services) and JSON (Seerr) configuration files.
- **Verification:**
    - **XML Parsing:** A sample XML file with a `<ApiKey>` tag must yield the correct string.
    - **JSON Parsing:** A sample JSON file with an `apiKey` field must yield the correct string.
    - **Resilience:** Missing files or missing tags should result in a `null` value for that specific key, not a service crash (500 error).
    - Automated tests in `services/registry/tests/test_scanner.py` must pass.

### 4. API Response Structure
- **Requirement:** The `GET /config` endpoint must return data in a format compatible with the Flutter client.
- **Verification:**
    - The response must be a JSON object.
    - It must contain fields like `lidarr_key`, `radarr_key`, `sonarr_key`, `prowlarr_key`, and `seerr_key`.
    - Example successful response:
      ```json
      {
        "lidarr_key": "abc123...",
        "radarr_key": null,
        "sonarr_key": "def456...",
        "prowlarr_key": "ghi789...",
        "seerr_key": "jkl012..."
      }
      ```
    - Automated tests in `services/registry/tests/test_api.py` must pass.

## Success Criteria (Overall Phase)
- All automated tests (`pytest`) pass.
- The service starts and responds on port 8000.
- `GET /config` is fully secured and functional against mock configuration files.
