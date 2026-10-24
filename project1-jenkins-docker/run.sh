#!/bin/bash
# Builds and runs Jenkins in Docker (with access to the host Docker engine)
set -e
cd "$(dirname "$0")"
docker network create jenkins-net 2>/dev/null || true
docker build -t my-jenkins .
docker rm -f jenkins 2>/dev/null || true
docker run -d --name jenkins --network jenkins-net -u root \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  my-jenkins
echo "Waiting for Jenkins to start..."
sleep 40
echo "Open http://localhost:8080 and use this admin password:"
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
