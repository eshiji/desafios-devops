#!/bin/bash
image=eshijii/idwallapp:v1
port=3000
deployment_name=idwallapp
# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install minikube
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.2/minikube-linux-amd64
sudo chmod +x minikube
sudo mv minikube /usr/local/bin/

# Start minikube
sudo minikube start

sudo kubectl run $deployment_name --image=$image --port=$port --env="NAME=Rafael"

sudo kubectl expose deployment $deployment_name --type=NodePort
sleep 60

curl $(sudo minikube service $deployment_name --url)

#sudo kubectl run idwallap --image=desafio_devops_idwall --port=3000

#sudo kubectl expose deployment idwallapp --type=NodePort
