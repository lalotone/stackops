#!/bin/bash
# Temporal script to check if prometheus-node exporter is running on some
# Terraform nodes.

# Add here the subnet range to scan
IP_RANGE='192.168.1.0/24'

# RUNTIME VARS
PROM_NODES=$(nmap -p 9100 $IP_RANGE --open | grep report | awk '{ print $5 }')
TF_NODES=()

for NODE in $PROM_NODES; do
  # echo "Scanning node: $NODE"
  curl -s $NODE:9100/metrics | grep 'nodename="ubuntu"' > /dev/null
  TF_NODE=$?
  if [ $TF_NODE -eq 0 ]; then
    TF_NODES+=($NODE)
  fi    
done

echo "###############"
echo "POSIBLES VMS DE TERRAFORM"
echo "###############"

printf '%s\n' "${TF_NODES[@]}"
