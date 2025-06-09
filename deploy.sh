#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

NAMESPACE="${NAMESPACE:-crapi}"

kubectl create namespace "${NAMESPACE}" --dry-run=client -o yaml | kubectl apply -f -

if [ ! -d "../keys" ]; then
  echo "error: ../keys directory not found; generate the JWT keys before deploying" >&2
  exit 1
fi
kubectl create secret generic jwt-key-secret --from-file=../keys -n "${NAMESPACE}" --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -n "${NAMESPACE}" -f ./rbac
kubectl apply -n "${NAMESPACE}" -f ./mongodb
kubectl apply -n "${NAMESPACE}" -f ./postgres
kubectl apply -n "${NAMESPACE}" -f ./mailhog
kubectl apply -n "${NAMESPACE}" -f ./identity
kubectl apply -n "${NAMESPACE}" -f ./community
kubectl apply -n "${NAMESPACE}" -f ./workshop
kubectl apply -n "${NAMESPACE}" -f ./gateway-service
kubectl apply -n "${NAMESPACE}" -f ./web
