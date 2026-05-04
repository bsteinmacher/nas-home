from fastapi import FastAPI, Depends
from .schemas import RegistryConfig
from .security import validate_token
from .scanner import get_servarr_key, get_seerr_key
from .config import settings

app = FastAPI(title="NAS Registry Service")

@app.get("/")
async def health_check():
    return {"status": "ok"}

@app.get("/config", response_model=RegistryConfig)
async def get_config(token: str = Depends(validate_token)):
    return RegistryConfig(
        lidarr_key=get_servarr_key(settings.lidarr_config_path),
        radarr_key=get_servarr_key(settings.radarr_config_path),
        sonarr_key=get_servarr_key(settings.sonarr_config_path),
        prowlarr_key=get_servarr_key(settings.prowlarr_config_path),
        seerr_key=get_seerr_key(settings.seerr_settings_path)
    )
