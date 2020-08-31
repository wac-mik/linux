echo "Install required packages"
NFS_PATH='/mnt/nfs'

sudo apt-get install nfs-kernel-server -y

sudo mkdir -p $NFS_PATH

sudo chown -R pi:pi $NFS_PATH
#sudo find /mnt/nfs -type d -exec chmod 755 {} \;
#sudo find /mnt/nfs -type f -exec chmod 644 {} \;

sudo sed -i '/Generated/d' /etc/exports
echo "$NFS_PATH *(rw,all_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000) # Generated" | sudo tee -a /etc/exports

sudo exportfs -ra

hostname -I
