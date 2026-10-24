#!/bin/bash
# Demonstrates Git Flow in a throwaway repo and saves the branch graph to gitflow-output.txt
set -e
OUT="$(cd "$(dirname "$0")" && pwd)/gitflow-output.txt"
D=$(mktemp -d) && cd "$D"
git init -q gitflow-demo && cd gitflow-demo
git config user.email "demo@example.com"; git config user.name "Demo"
echo "# Demo" > README.md && git add . && git commit -qm "Initial commit"
git branch -M main
git checkout -qb develop

# Feature
git checkout -qb feature/login develop
echo "login" > login.txt && git add . && git commit -qm "Add login feature"
git checkout -q develop && git merge -q --no-ff feature/login -m "Merge feature/login" && git branch -d feature/login

# Release
git checkout -qb release/1.0.0 develop
echo "1.0.0" > VERSION && git add . && git commit -qm "Bump version to 1.0.0"
git checkout -q main && git merge -q --no-ff release/1.0.0 -m "Release 1.0.0" && git tag -a v1.0.0 -m "Release 1.0.0"
git checkout -q develop && git merge -q --no-ff release/1.0.0 -m "Merge release/1.0.0 back" && git branch -d release/1.0.0

# Hotfix
git checkout -qb hotfix/1.0.1 main
echo "1.0.1" > VERSION && git add . && git commit -qm "Hotfix 1.0.1"
git checkout -q main && git merge -q --no-ff hotfix/1.0.1 -m "Hotfix 1.0.1" && git tag -a v1.0.1 -m "Hotfix 1.0.1"
git checkout -q develop && git merge -q --no-ff hotfix/1.0.1 -m "Merge hotfix/1.0.1" && git branch -d hotfix/1.0.1

git log --graph --oneline --all --decorate | tee "$OUT"
echo "Saved graph to $OUT"
