# NAS Registry Service

A configuration and discovery service for the NAS environment.

## Setup

1. Create a virtual environment:
   ```bash
   python -m venv .venv
   source .venv/bin/activate
   ```

2. Install dependencies:
   ```bash
   pip install .
   # or for development
   pip install ".[dev]"
   ```

3. Configure environment:
   ```bash
   cp .env.example .env
   # Edit .env with your token and paths
   ```

## Running

```bash
uvicorn app.main:app --reload
```

## Testing

```bash
pytest
```
