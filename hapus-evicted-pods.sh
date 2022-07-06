#!/bin/bash

PODS=$(kubectl get pod -A | grep Evicted)

if [[ -z $PODS ]]; then
    exit 0
fi

for p in $PODS;
do
    kubectl delete pod $(echo $p | awk '{print $2}') -n $(echo $p | awk '{print $1}')
done
