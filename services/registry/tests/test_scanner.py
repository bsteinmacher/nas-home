import os
import pytest
from app.scanner import get_servarr_key, get_seerr_key

def test_get_servarr_key_success():
    mock_path = "tests/mocks/lidarr_config.xml"
    # Assuming the test is run from services/registry
    assert get_servarr_key(mock_path) == "LIDARR_KEY"

def test_get_seerr_key_success():
    mock_path = "tests/mocks/seerr_settings.json"
    assert get_seerr_key(mock_path) == "SEERR_KEY"

def test_get_servarr_key_missing_file():
    assert get_servarr_key("non_existent.xml") is None

def test_get_seerr_key_missing_file():
    assert get_seerr_key("non_existent.json") is None

def test_get_servarr_key_missing_tag():
    mock_path = "tests/mocks/invalid_config.xml"
    with open(mock_path, "w") as f:
        f.write("<Config><OtherTag>Value</OtherTag></Config>")
    
    try:
        assert get_servarr_key(mock_path) is None
    finally:
        if os.path.exists(mock_path):
            os.remove(mock_path)

def test_get_seerr_key_missing_field():
    mock_path = "tests/mocks/invalid_settings.json"
    with open(mock_path, "w") as f:
        f.write('{"otherField": "Value"}')
    
    try:
        assert get_seerr_key(mock_path) is None
    finally:
        if os.path.exists(mock_path):
            os.remove(mock_path)
