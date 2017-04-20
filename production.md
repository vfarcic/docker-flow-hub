# Production

## Deploy

```bash
docker network create --driver overlay proxy

curl -o infra.yml \
    https://raw.githubusercontent.com/vfarcic/\
docker-flow-hub/master/stack.yml

JENKINS_USER=[...] \
  JENKINS_PASS=[...] \
  docker stack deploy -c infra.yml infra

docker run -it --rm \
  --volume-driver cloudstor:aws -v infra_jenkins:/var/jenkins_home \
  alpine cat /var/jenkins_home/secrets/initialAdminPassword

open "http://jenkins.dockerflow.com"
```
