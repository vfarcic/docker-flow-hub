```bash
helm upgrade -i docker-flow-hub \
    helm/docker-flow-hub \
    --namespace df

kubectl -n df \
    rollout status \
    deployment docker-flow-hub
```