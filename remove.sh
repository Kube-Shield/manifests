#!/bin/bash
cd "$(dirname $0)"
kubectl create namespace crapi
#kubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml

kubectl create -n secret generic jwt-key-secret --from-file=../keys
kubectl delete -n crapi -f ./rbac
kubectl delete -n crapi -f ./mongodb
kubectl delete -n crapi -f ./postgres
kubectl delete -n crapi -f ./mailhog
kubectl delete -n crapi -f ./identity
kubectl delete -n crapi -f ./community
kubectl delete -n crapi -f ./workshop
kubectl delete -n crapi -f ./web
