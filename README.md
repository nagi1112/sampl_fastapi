# sample-fastapi-ci-k8s

## Быстрый старт
1) Сборка локально: ash scripts/build_local.sh
2) Minikube:
   - ash scripts/minikube_start.sh
   - ash scripts/minikube_deploy.sh
   - открыть URL из minikube service demo-app --url → /health, /whoami, /metrics
3) Мониторинг:
   - ash scripts/monitoring_install.sh
   - kubectl apply -f k8s/prometheus-servicemonitor.yaml
   - kubectl -n monitoring port-forward svc/monitoring-grafana 3000:80
   - Grafana: http://localhost:3000 (см. креды релиза)
