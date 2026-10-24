# Project 4: Distributed Jenkins (Maven on two agents)
1. Run project1 (`bash ../project1-jenkins-docker/run.sh`) so Jenkins is up on network `jenkins-net`.
2. Manage Jenkins -> Nodes -> New Node (Permanent Agent):
   - `build-node`: label `build`, remote dir `/home/jenkins/agent`, launch method "Launch agent by connecting it to the controller"
   - `test-node`: label `test`, same settings
   - Copy the secret of each node (open the node page).
3. `bash run-agents.sh <BUILD_SECRET> <TEST_SECRET>` -> both nodes go online.
4. New Item -> Pipeline from SCM -> your repo, Script Path `project4-jenkins-distributed/Jenkinsfile`.
5. Build Now. Console log shows "Running on build-node" then "Running on test-node".
