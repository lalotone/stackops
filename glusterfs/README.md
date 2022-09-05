# Steps to create the GlusterFS cluster used on K8s cluster
## Caution: Just for testing environments

Info: https://docs.gluster.org/en/main/Quick-Start-Guide/Quickstart/

# On all the nodes that will be used for storage
sudo apt install glusterfs-server

sudo systemctl enable glusterd
sudo systemctl start glusterd

# From k8s-master1

sudo gluster peer probe k8s-master2
sudo gluster peer probe k8s-master1

sudo gluster peer status

# On 3 masters

sudo mkdir -p /gluster/brick1/gv0

# On k8s-master1. Caution: Not the best idea to use root FS for GlusterFS, recommended secondary disk for that.
# TODO: Add more disks to testing VMs.

# On k8s-master1
sudo gluster volume create gv0 replica 3 k8s-master1:/gluster/brick1/gv0 k8s-master2:/gluster/brick1/gv0 k8s-master3:/gluster/brick1/gv0 force
sudo gluster volume info

# Just for testing that gluster can be mounted, on k8s-master1
sudo mount -t glusterfs server1:/gv0 /mnt
