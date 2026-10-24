#!/bin/bash
# Creates the Angular app with Angular CLI and copies Docker files into it. Needs Node 20.19+ / 22 and npm.
set -e
cd "$(dirname "$0")"
npx -y @angular/cli@latest new my-angular-app --defaults --skip-git --skip-tests
cp templates/Dockerfile templates/Dockerfile.dev templates/.dockerignore templates/docker-compose.yml templates/docker-compose.prod.yml my-angular-app/
echo "Done. Next:"
echo "  cd my-angular-app"
echo "  docker compose up --build                                  # DEV  -> http://localhost:4200"
echo "  docker compose -f docker-compose.prod.yml up -d --build    # PROD -> http://localhost:8081"
