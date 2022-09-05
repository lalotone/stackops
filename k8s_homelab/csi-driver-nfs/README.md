# Useful info

NFS stack installed with Ansible playbook: 01_install_nfs_packages.yaml

Ref: https://github.com/kubernetes-csi/csi-driver-nfs/blob/master/charts/README.md
Installed version of NFS CSI Driver: 4.1.0

Command used: helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --version v4.1.0
