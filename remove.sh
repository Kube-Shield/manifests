#!/usr/bin/env bash
set -uo pipefail
cd "$(dirname "$0")"

NAMESPACE="${NAMESPACE:-crapi}"

kubectl delete -n "${NAMESPACE}" -f ./web --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./gateway-service --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./workshop --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./community --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./identity --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./mailhog --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./postgres --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./mongodb --ignore-not-found
kubectl delete -n "${NAMESPACE}" -f ./rbac --ignore-not-found
kubectl delete secret jwt-key-secret -n "${NAMESPACE}" --ignore-not-found
