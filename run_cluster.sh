#!/bin/bash
# run_cluster.sh - Sets up Ray cluster for distributed inference
# Usage: bash run_cluster.sh <head|worker>

MODE=$1

if [ "$MODE" == "head" ]; then
    ray start --head --node-ip-address=$(hostname -I | awk '{print $1}')
elif [ "$MODE" == "worker" ]; then
    ray start --address='ray://head-node-ip:6379'
else
    echo "Usage: run_cluster.sh <head|worker>"
fi
