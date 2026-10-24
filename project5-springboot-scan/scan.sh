#!/bin/bash
# Push images to a registry and scan them for vulnerabilities.
# Default: free local registry + Trivy (stand-in for Docker Trusted Registry, which needs a Mirantis licence).
# For real DTR: REGISTRY=<dtr-host>/<org> bash scan.sh   (run `docker login <dtr-host>` first; enable "Scan on push" in DTR UI)
set -e
cd "$(dirname "$0")"
REGISTRY=${REGISTRY:-localhost:5000}
docker compose build
if [ "$REGISTRY" = "localhost:5000" ]; then
  docker rm -f registry 2>/dev/null || true
  docker run -d -p 5000:5000 --name registry registry:2
  sleep 3
fi
for app in store-web catalog-web checkout-web; do
  docker tag $app:1.0 $REGISTRY/$app:1.0
  docker push $REGISTRY/$app:1.0
done
mkdir -p scan-reports
for app in store-web catalog-web checkout-web; do
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:latest \
    image --severity HIGH,CRITICAL $REGISTRY/$app:1.0 | tee scan-reports/$app.txt
done
echo "Reports saved in scan-reports/"
