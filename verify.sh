#!/bin/sh
mkdir build || true
kubectl port-forward --namespace default svc/redis-master 6379:6379 > build/redis.log 2>&1 &
echo AUTH redis | redis-cli > build/output.txt

while [[ ! $(cat build/output.txt) = "OK" ]]; do
    kubectl port-forward --namespace default svc/redis-master 6379:6379 > build/redis.log 2>&1 &
    echo AUTH redis | redis-cli > build/output.txt
    sleep 5
done