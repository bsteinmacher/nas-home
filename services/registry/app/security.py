import os
import secrets
from fastapi import Header, HTTPException, status, Depends
from fastapi.security import APIKeyHeader

API_KEY_NAME = "X-Registry-Token"
api_key_header = APIKeyHeader(name=API_KEY_NAME, auto_error=False)

from .config import settings

def validate_token(api_key: str = Depends(api_key_header)):
    expected_token = settings.registry_token
    
    if not expected_token:
        # If no token is configured in the environment, we might want to fail-safe
        # or allow in dev. But per requirements, it must be enforced.
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Registry token not configured on server"
        )

    if not api_key or not secrets.compare_digest(api_key, expected_token):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Invalid or missing Registry Token"
        )
    return api_key
