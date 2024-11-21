#!/bin/bash

kubectl delete job.batch/deploy-mysql -n default
kubectl delete deployment.apps/devops-demo -n default
kubectl delete statefulset.apps/mysql -n default
kubectl delete service/mysql -n default
kubectl delete service/devops-demo-service -n default

kubectl delete pvc mysql-pvc-mysql-0 -n default
kubectl delete pv mysql-pv

kubectl delete configmap nginx-config -n default
kubectl delete secret mysql-password -n default
