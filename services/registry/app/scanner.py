import os
import xml.etree.ElementTree as ET
import json
import logging
from typing import Optional

logger = logging.getLogger(__name__)

def get_servarr_key(file_path: str) -> Optional[str]:
    """
    Extracts the ApiKey from a Lidarr-style config.xml.
    """
    if not os.path.exists(file_path):
        logger.warning(f"Config file not found: {file_path}")
        return None
    
    try:
        tree = ET.parse(file_path)
        root = tree.getroot()
        api_key_elem = root.find("ApiKey")
        if api_key_elem is not None:
            return api_key_elem.text
        return None
    except ET.ParseError as e:
        logger.error(f"Failed to parse XML config {file_path}: {e}")
        return None
    except Exception as e:
        logger.error(f"Unexpected error reading {file_path}: {e}")
        return None

def get_seerr_key(file_path: str) -> Optional[str]:
    """
    Extracts the apiKey from a Seerr/Jellyseerr settings.json.
    """
    if not os.path.exists(file_path):
        logger.warning(f"Settings file not found: {file_path}")
        return None
    
    try:
        with open(file_path, "r") as f:
            data = json.load(f)
            # Seerr stores apiKey in the 'main' object
            if "main" in data and isinstance(data["main"], dict):
                return data["main"].get("apiKey")
            return data.get("apiKey")
    except (json.JSONDecodeError, IOError) as e:
        logger.error(f"Failed to read/parse JSON settings {file_path}: {e}")
        return None
    except Exception as e:
        logger.error(f"Unexpected error reading {file_path}: {e}")
        return None
