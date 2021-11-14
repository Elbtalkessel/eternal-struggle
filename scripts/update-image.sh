set -e
source ./env.sh

# Create empty image
#qemu-img create -f qcow2 OpenCore.qcow2 256M
# Enable NBD on host
# modprobe nbd max_part=8
# Connect empty image as network block device
sudo qemu-nbd --connect=/dev/nbd0 "$OPEN_CORE_IMG"
# Create table and partition
#fdisk /dev/nbd0
# Create filesystem
#mkfs.fat /dev/nbd0p1
# Mount created partition
sudo mount /dev/nbd0p1 /media
# Copy files
sudo rm -r /media/EFI
sudo cp -r "$EFI_DIR" /media/
tree /media
# Unmount
sudo umount /media
# Remove network block device
sudo qemu-nbd --disconnect /dev/nbd0
# Disable NBD
# rmmod nbd

