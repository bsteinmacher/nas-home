import os
import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

@pytest.fixture(autouse=True)
def mock_env(monkeypatch):
    from app.config import settings
    monkeypatch.setattr(settings, "registry_token", "test-token")

@pytest.fixture
def auth_header():
    return {"X-Registry-Token": "test-token"}

def test_config_no_token():
    response = client.get("/config")
    assert response.status_code == 403

def test_config_invalid_token():
    response = client.get("/config", headers={"X-Registry-Token": "wrong-token"})
    assert response.status_code == 403

def test_config_valid_token(auth_header):
    response = client.get("/config", headers=auth_header)
    assert response.status_code == 200
