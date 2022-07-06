#!/bin/bash
read -p 'pod name : ' pod
read -p 'namespace : ' ns
read -p 'port : ' port
#echo $pod, $ns, $pod
PODS=$(kubectl get pod -n $ns | grep $pod | awk {'print $1}')
for po in $PODS;
do
        echo -n "reloading config $po: "
        kubectl exec -n $ns $po -- wget -O- --post-data "" http://localhost:$port/-/reload
        echo "done."
        echo "====="
done
