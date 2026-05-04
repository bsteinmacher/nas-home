import os
import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

@pytest.fixture
def mock_env(monkeypatch):
    monkeypatch.setenv("REGISTRY_TOKEN", "test-token")
    monkeypatch.setenv("LIDARR_CONFIG_PATH", "tests/mocks/lidarr_config.xml")
    monkeypatch.setenv("SEERR_SETTINGS_PATH", "tests/mocks/seerr_settings.json")
    # Reset settings to pick up new env vars if necessary
    # Since settings is imported at module level in app.main, 
    # we might need to patch it directly or reload the module.
    # For now, let's see if patching os.environ before import works or if we should patch app.config.settings
    from app.config import settings
    monkeypatch.setattr(settings, "lidarr_config_path", "tests/mocks/lidarr_config.xml")
    monkeypatch.setattr(settings, "seerr_settings_path", "tests/mocks/seerr_settings.json")

def test_get_config_success(mock_env):
    response = client.get(
        "/config",
        headers={"X-Registry-Token": "test-token"}
    )
    assert response.status_code == 200
    data = response.json()
    assert data["lidarr_key"] == "LIDARR_KEY"
    assert data["seerr_key"] == "SEERR_KEY"
    assert data["radarr_key"] is None # Not mocked

def test_get_config_unauthorized(mock_env):
    response = client.get(
        "/config",
        headers={"X-Registry-Token": "wrong-token"}
    )
    assert response.status_code == 403

def test_get_config_no_token(mock_env):
    response = client.get("/config")
    assert response.status_code == 403
