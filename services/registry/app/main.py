from fastapi import FastAPI, Depends
from .schemas import RegistryConfig
from .security import validate_token

app = FastAPI(title="NAS Registry Service")

@app.get("/")
async def health_check():
    return {"status": "ok"}

@app.get("/config", response_model=RegistryConfig)
async def get_config(token: str = Depends(validate_token)):
    # Stub for now
    return RegistryConfig()
