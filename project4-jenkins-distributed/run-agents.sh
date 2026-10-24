#!/bin/bash
# Usage: bash run-agents.sh <BUILD_NODE_SECRET> <TEST_NODE_SECRET>
# Requires the Jenkins controller from project1 (container "jenkins" on network jenkins-net)
set -e
[ $# -ne 2 ] && { echo "Usage: bash run-agents.sh <build-secret> <test-secret>"; exit 1; }
cd "$(dirname "$0")"
docker network create jenkins-net 2>/dev/null || true
docker build -t maven-agent -f Dockerfile.agent .
docker rm -f build-agent test-agent 2>/dev/null || true
docker run -d --name build-agent --network jenkins-net maven-agent \
  -url http://jenkins:8080 -webSocket -workDir=/home/jenkins/agent "$1" build-node
docker run -d --name test-agent --network jenkins-net maven-agent \
  -url http://jenkins:8080 -webSocket -workDir=/home/jenkins/agent "$2" test-node
echo "Agents started. Check Manage Jenkins -> Nodes (both should be online)."
