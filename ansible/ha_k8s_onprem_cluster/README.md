# K8s OnPrem HA cluster


## Base idea:

![alt text](https://d33wubrfki0l68.cloudfront.net/d1411cded83856552f37911eb4522d9887ca4e83/b94b2/images/kubeadm/kubeadm-ha-topology-stacked-etcd.svg)

Create all the .yaml files required to deploy a K8s cluster with:

- 3 master nodes to increase HA.
- 3 HAProxies, running on on each master node using a floating IP (Keepalived)
- Deploy networking plugin (Calico)
- "N" worker nodes, determined by Ansible inventory

## Currently supported systems:

- Debian > 10
- Ubuntu > Xenial

## Current K8s version:

- v 1.22 -> Mark holded, to avoid non-controlled package upgrades.

## Posible future features:

Implement Nginx Ingress controller for bare metal setup, using HAProxy + NodePort to expose services.