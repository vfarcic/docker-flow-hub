# Production

## Deploy

```bash
# Create dir /workspace on all nodes and change its permissions to 777

docker network create --driver overlay proxy

curl -o infra.yml \
    https://raw.githubusercontent.com/vfarcic/\
docker-flow-hub/master/stack.yml

JENKINS_USER=[...] \
  JENKINS_PASS=[...] \
  docker stack deploy -c infra.yml infra
```
