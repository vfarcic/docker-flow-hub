# Production

## Deploy

```bash
# Repeat on all nodes

sudo mkdir /workspace && sudo chmod 777 /workspace

docker network create --driver overlay proxy

curl -o infra.yml \
    https://raw.githubusercontent.com/vfarcic/\
docker-flow-hub/master/stack.yml

JENKINS_USER=vfarcic \
  JENKINS_PASS=DevOps20 \
  docker stack deploy -c infra.yml infra

docker run -it --rm \
  --volume-driver cloudstor:aws -v infra_jenkins:/var/jenkins_home \
  alpine cat /var/jenkins_home/secrets/initialAdminPassword

# docker service update --publish-add 8080:8080 infra_jenkins

open "http://jenkins.dockerflow.com"

```
