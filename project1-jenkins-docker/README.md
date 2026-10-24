# Project 1: Dockerized Jenkins Pipeline
1. `bash run.sh` -> prints the admin password.
2. Open http://localhost:8080, paste password, install suggested plugins, create admin user.
3. New Item -> Pipeline -> Pipeline script from SCM -> Git -> your GitHub repo URL.
   **Script Path:** `project1-jenkins-docker/Jenkinsfile` (branch `main`)
4. Build Now. Open http://localhost:9090 to see the deployed app.
