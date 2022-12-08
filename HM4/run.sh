#!/bin/sh
kind create cluster
kubectl cluster-info --context kind-kind
sleep 20

kubectl apply -f ubuntu-pod.yaml
kubectl expose pod ubuntu --type=NodePort --name=ubuntu-service --port=5000
kubectl expose pod ubuntu --type=NodePort --name=ubuntu-service-frontend --port=8080
sleep 30
kubectl exec --stdin ubuntu -- /bin/bash < ./deploy_server.sh

kubectl apply -f tarantool.yaml
kubectl expose pod tarantool --name=tarantool-service --port=3301 --type=NodePort
sleep 20
kubectl exec --stdin tarantool -- console < init.lua

kubectl get pods
