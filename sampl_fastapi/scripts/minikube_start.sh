#!/usr/bin/env bash
set -euo pipefail
minikube start --driver=docker
kubectl get nodes -o wide
