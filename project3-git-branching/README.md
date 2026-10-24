# Project 3: Git Flow Branching Model

```
main     o----------------o-----------o  (tags v1.0.0, v1.0.1)  production only
          \              /  \         /
hotfix     \            /    o-------o   hotfix/x -> main + develop
develop  o--o----o-----o-------o-----o   integration branch
              \  /      \
feature        o-o       release/x -> main + develop
```

| Branch | Created from | Merges into | Purpose |
|---|---|---|---|
| main | - | - | Production code, tagged releases |
| develop | main | release | Integration of features |
| feature/* | develop | develop | New work |
| release/* | develop | main + develop | Stabilise a release |
| hotfix/* | main | main + develop | Urgent production fix |

Rules: merge with `--no-ff` through Pull Requests, require 1 review, protect `main` and `develop`.
Run `bash gitflow-demo.sh` to see it in action (output in gitflow-output.txt).
