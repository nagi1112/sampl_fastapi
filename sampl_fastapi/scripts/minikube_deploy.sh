#!/usr/bin/env bash
set -euo pipefail

IMAGE=demo-fastapi
TAG=local

docker image inspect \:\ >/dev/null 2>&1 || docker build -t \:\ .
minikube image load \:\

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

minikube service demo-app --url
