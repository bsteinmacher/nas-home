from fastapi import FastAPI
from .schemas import RegistryConfig

app = FastAPI(title="NAS Registry Service")

@app.get("/")
async def health_check():
    return {"status": "ok"}

@app.get("/config", response_model=RegistryConfig)
async def get_config():
    # Stub for now
    return RegistryConfig()
