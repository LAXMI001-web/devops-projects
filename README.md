# DevOps Lab Projects (1-9)

| # | Folder | Run |
|---|---|---|
| 1 | project1-jenkins-docker | `bash run.sh`, then create pipeline job in Jenkins UI |
| 2 | project2-angular-docker | `bash setup.sh`, then compose dev/prod |
| 3 | project3-git-branching | `bash gitflow-demo.sh` |
| 4 | project4-jenkins-distributed | create 2 nodes in UI, `bash run-agents.sh <s1> <s2>` |
| 5 | project5-springboot-scan | `docker compose up -d --build`, `bash scan.sh` |
| 6 | project6-autoscaling | `bash deploy.sh`, `bash load.sh` |
| 7 | project7-mongo-k8s | `bash deploy.sh` |
| 8 | project8-microservices | `bash deploy.sh` |
| 9 | project9-apache-k8s | `bash deploy.sh` |

Prerequisites: Docker, Git, Node 20+ (project 2), Minikube + kubectl (projects 6-9).
Jenkins jobs (1 and 4) read the Jenkinsfiles from this repo, so push to GitHub first (`bash push-to-github.sh <url>`).
