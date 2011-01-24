# Update our package index.
apt-get update

# Upgrade our existing packages.
apt-get -y upgrade

# Install our build packages necessary to install VMWare Tools.
apt-get -y install build-essential
apt-get -y install linux-headers-`uname -r`

# Wait until the VMWare Host mounts the fake CD-ROM.
read -p "Choose to Update/Instal VMWare Tools from VMWare->Virtual Machine menu and hit [enter]: "

# Create our cdrom mount point if it doesn't already exist and mount it.
mkdir -p /media/cdrom
mount /dev/cdrom /media/cdrom

# Copy out, unarchive and run the VMWare Tools Installer
cp /media/cdrom/VMware*.tar.gz /tmp/
cd /tmp/
tar -zxvf VMware*.tar.gz
cd vmware-tools-distrib/
./vmware-install.pl -d

# At this point it should be possible to mount /mnt/hgfs and gain access to shared folders.