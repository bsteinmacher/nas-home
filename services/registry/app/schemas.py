from pydantic import BaseModel
from typing import Optional

class RegistryConfig(BaseModel):
    lidarr_key: Optional[str] = None
    radarr_key: Optional[str] = None
    sonarr_key: Optional[str] = None
    prowlarr_key: Optional[str] = None
    seerr_key: Optional[str] = None
