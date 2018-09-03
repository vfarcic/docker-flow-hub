```bash
helm upgrade -i docker-flow-hub \
    helm/devops-toolkit \
    --namespace df

kubectl -n df \
    rollout status \
    deployment docker-flow-hub
```