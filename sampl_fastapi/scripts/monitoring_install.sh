#!/usr/bin/env bash
set -euo pipefail
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace
kubectl -n monitoring rollout status deploy/monitoring-grafana --timeout=180s || true
kubectl -n monitoring get pods
