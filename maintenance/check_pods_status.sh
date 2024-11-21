#!/bin/bash

iter=0
return_code=0
readonly MAX_ITERATIONS=60
RED='\033[0;31m'
NC='\033[0m'

kubectl get pods -n default --no-headers -o custom-columns=":metadata.name,:status.phase" | grep mysql | grep -q Running
return_code=$?
if [ $return_code -ne 0 ]; then
    echo "waiting until mysql pod become ready"
fi
while [[ $return_code -ne 0 && iter -le MAX_ITERATIONS ]]; do
    echo -n "."
    sleep 5
    iter=$(( $iter + 1 ))
    kubectl get pods -n default --no-headers -o custom-columns=":metadata.name,:status.phase" | grep mysql | grep -q Running
    return_code=$?
done
if [ $return_code -eq 0 ]; then
    echo -e "\nmysql pods are up"
else
    echo -e "\n${RED}mysql pods seems to be failed, please check pod logs with the following commands:"
    echo "kubectl get pods"
    echo -e "kubectl logs <pod name>${NC}"
fi

iter=0
kubectl get pods -n default --no-headers -o custom-columns=":metadata.name,:status.phase" | grep devops-demo | grep -q Running
return_code=$?
if [ $return_code -ne 0 ]; then
    echo "waiting until devops-demo pod become ready"
fi
while [[ $return_code -ne 0 && iter -le MAX_ITERATIONS ]]; do
    echo -n "."
    sleep 5
    iter=$(( $iter + 1 ))
    kubectl get pods -n default --no-headers -o custom-columns=":metadata.name,:status.phase" | grep devops-demo | grep -q Running
    return_code=$?
done
if [ $return_code -eq 0 ]; then
    echo -e "\ndevops-demo pods are up"
    echo -e "\ningress info:"
    pod_ip=$(kubectl get ingress -n default)
    echo -e "\ndevops-demo ip address: $pod_ip\n"
else
    echo -e "\n${RED}devops-demo pods seems to be failed, please check pod logs with the following commands:"
    echo "kubectl get pods"
    echo -e "kubectl logs <pod name>${NC}"
fi
