#!/bin/bash
set -eux

dnf update -y
dnf install -y docker

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

docker pull ${docker_image}

docker rm -f node-devops-project || true

docker run -d \
  --name node-devops-project \
  --restart always \
  -p ${app_port}:${app_port} \
  -e PORT=${app_port} \
  -e NODE_ENV=production \
  ${docker_image}