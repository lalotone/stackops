#!/bin/bash
# Temporal script to check if prometheus-node exporter is running on some
# Terraform nodes.

# Add here the subnet range to scan
# IP_RANGE='192.168.1.0/24'
IP_RANGE='192.168.122.0/24'

# RUNTIME VARS
PROM_NODES=$(nmap -p 9100 $IP_RANGE --open | grep report | awk '{ print $5 }')
# TF_NODES=()

for NODE in $PROM_NODES; do
  # echo "Scanning node: $NODE"
  RAM=$(ssh -q -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" testing@$NODE free -h | grep Mem: | awk '{ print $2 }')
  curl -s $NODE:9100/metrics | grep 'nodename="ubuntu"' > /dev/null
  TF_NODE=$?
  if [ $TF_NODE -eq 0 ]; then
    TF_NODES+=($NODE)
    echo "$NODE host with - $RAM - available"
  fi    
done

# echo "###############"
# echo "POSIBLES VMS DE TERRAFORM"
# echo "###############"

echo "RAW node list:"
printf '%s\n' "${TF_NODES[@]}"
