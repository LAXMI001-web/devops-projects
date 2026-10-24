# Project 5: Spring Boot apps on Docker + image scanning
- `docker compose up -d --build` -> store :8081, catalog :8082, checkout :8083
- `bash scan.sh` -> pushes to local registry and scans with Trivy (reports in scan-reports/)
- With a Docker Trusted Registry licence: `REGISTRY=<dtr-host>/<org> bash scan.sh`, then enable
  System -> Security -> Image scanning and repo Settings -> "Scan on push" in the DTR UI.
