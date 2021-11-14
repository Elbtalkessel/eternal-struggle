# Create empty image
#qemu-img create -f qcow2 OpenCore.qcow2 256M
# Enable NBD on host
modprobe nbd max_part=8
# Connect empty image as network block device
qemu-nbd --connect=/dev/nbd0 OpenCore.qcow2
# Create table and partition
#fdisk /dev/nbd0
# Create filesystem
#mkfs.fat /dev/nbd0p1
# Mount created partition
mount /dev/nbd0p1 /media
# Copy files
cp -r EFI/ /media/
# Unmount
umount /media
# Remove network block device
qemu-nbd --disconnect /dev/nbd0
# Disable NBD
rmmod nbd

