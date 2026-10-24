#!/bin/bash
# 1) Create an EMPTY repo on github.com (no README). 2) Run:  bash push-to-github.sh https://github.com/<you>/<repo>.git
set -e
[ -z "$1" ] && { echo "Usage: bash push-to-github.sh <repo-url>"; exit 1; }
cd "$(dirname "$0")"
git init 2>/dev/null || true
git add .
git commit -m "Add DevOps lab projects 1-9" || true
git branch -M main
git remote remove origin 2>/dev/null || true
git remote add origin "$1"
git push -u origin main
git checkout -b develop && git push -u origin develop && git checkout main
