#!/bin/bash

# Configure secrets and configmaps
kubectl apply -f k8s/mysql-secret.yaml -n default
kubectl apply -f k8s/nginx-configmap.yaml -n default
kubectl apply -f k8s/certificate.yaml -n default

# Configure storage for mysql
kubectl apply -f k8s/storage-class.yaml -n default
kubectl apply -f k8s/mysql-pv.yaml -n default

# Configure mysql
kubectl apply -f k8s/mysql-service.yaml -n default
kubectl apply -f k8s/mysql-statefulset.yaml -n default

# Configure devops-demo application
kubectl apply -f k8s/devops-demo-ingress.yaml -n default
kubectl apply -f k8s/devops-demo-service.yaml -n default
kubectl apply -f k8s/devops-demo-deployment.yaml -n default

# Run db deploy job
kubectl apply -f k8s/kind/skeema_job.yaml -n default

./maintenance/check_pods_status.sh
