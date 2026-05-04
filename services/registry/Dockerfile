# Stage 1: Build dependencies
FROM python:3.12-slim as builder

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml .
# Install dependencies to a temporary directory
RUN pip install --no-cache-dir --prefix=/install fastapi[standard] uvicorn python-dotenv pydantic-settings

# Stage 2: Final image
FROM python:3.12-slim

WORKDIR /app

# Create non-root user
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Copy installed dependencies from builder
COPY --from=builder /install /usr/local
# Copy application code
COPY . .

# Ensure appuser owns the application files
RUN chown -R appuser:appuser /app

# Run as non-root user
USER appuser

EXPOSE 8000

# Start the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--proxy-headers"]
