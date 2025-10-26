# Dockerfile
FROM python:3.11-slim

# set working dir
WORKDIR /app

# copy requirements and install
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY app /app

# use non-root user (small security step)
RUN useradd -m appuser && chown -R appuser /app
USER appuser

# expose port and run
EXPOSE 8080
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app", "--workers", "2"]
