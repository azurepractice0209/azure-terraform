#!/bin/bash

set -e

NAMESPACE="monitoring"
RELEASE="kube-prometheus"
OLD_GRAFANA_RELEASE="grafana"

echo "---------------------------------------"
echo " Kubernetes Monitoring Setup Script"
echo "---------------------------------------"

echo "[1/7] Adding Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "[2/7] Checking for old standalone Grafana release..."
if helm list -n $NAMESPACE | grep -q "$OLD_GRAFANA_RELEASE"; then
    echo "   ⚠ Removing old Grafana release: $OLD_GRAFANA_RELEASE"
    helm uninstall $OLD_GRAFANA_RELEASE -n $NAMESPACE || true
else
    echo "   ✔ No old Grafana release found."
fi

echo "[3/7] Installing Prometheus + Grafana (kube-prometheus-stack)..."
helm upgrade --install $RELEASE prometheus-community/kube-prometheus-stack \
  -n $NAMESPACE --create-namespace

echo "[4/7] Waiting for Grafana pod to be ready..."
kubectl wait --for=condition=ready pod \
  -n $NAMESPACE -l app.kubernetes.io/name=grafana --timeout=600s

echo "[5/7] Waiting for Prometheus pod to be ready..."
kubectl wait --for=condition=ready pod \
  -n $NAMESPACE -l app.kubernetes.io/name=prometheus --timeout=600s

echo "[6/7] Fetching Grafana admin password..."
GRAFANA_PASSWORD=$(kubectl get secret -n $NAMESPACE $RELEASE-grafana \
  -o jsonpath="{.data.admin-password}" | base64 --decode)

echo "---------------------------------------"
echo " Grafana Installed Successfully!"
echo "---------------------------------------"
echo "Username: admin"
echo "Password: $GRAFANA_PASSWORD"
echo ""

echo "[7/7] Starting port-forward for Grafana (http://localhost:3000)"
echo "Press CTRL + C to stop port-forward."
kubectl port-forward -n $NAMESPACE svc/$RELEASE-grafana 3000:80
