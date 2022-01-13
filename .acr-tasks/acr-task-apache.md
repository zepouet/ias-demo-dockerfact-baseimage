# DECLARE THE TASKS

```
az acr task create --name base-apache-24-alpine
                   --registry baseartifacts
                   -f .acr-tasks/acr-task-apache.yaml
                   --git-access-token $GIT_PATH
                   --set REGISTRY_FROM_URL=docker.io
                   --context https://github.com/zepouet/ias-demo-dockerfact-baseimage.git
```

# RUN THE TASKS
```
az acr task run --registry baseartifacts --name base-apache-24-alpine
```
