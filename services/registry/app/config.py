from pydantic_settings import BaseSettings, SettingsConfigDict
from typing import Optional

class Settings(BaseSettings):
    registry_token: str = "secret-token"
    
    lidarr_config_path: str = "/config/lidarr/config.xml"
    radarr_config_path: str = "/config/radarr/config.xml"
    sonarr_config_path: str = "/config/sonarr/config.xml"
    prowlarr_config_path: str = "/config/prowlarr/config.xml"
    seerr_settings_path: str = "/config/seerr/settings.json"

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

settings = Settings()
