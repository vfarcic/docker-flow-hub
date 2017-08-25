# Build

```bash
export AWS_ACCESS_KEY_ID=[...]

export AWS_SECRET_ACCESS_KEY=[...]

export AWS_DEFAULT_REGION=us-east-1

packer build -machine-readable test-cluster.json | tee test-cluster.log

export AMI_ID=$(grep 'artifact,0,id' test-cluster.log | cut -d: -f2)

# Launch new instance

PUBLIC_IP=[...]

ssh -i secrets/dockerflow.pem ubuntu@$PUBLIC_IP

IP=$(ifconfig eth0 | grep 'inet addr:'  | cut -d: -f2 | awk '{ print $1}')

docker swarm init --advertise-addr $IP
```