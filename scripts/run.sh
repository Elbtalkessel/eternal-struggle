#!/bin/sh

set -e
. ./env.sh

# Changes owner of a file or directory (recursively) to whoever owns run.sh
own() {
  owner=$(stat -c "%U" ./run.sh)
  chown -R "${owner}" -- "$1"
  echo "$1 now belongs to ${owner}"
}

mountEFI() {
  echo "Mounting ${BOOTLOADER}"
  qemu-nbd --connect=/dev/nbd0 "${BOOTLOADER}"
  sleep 1  # qemu-nbd exits before connect
  mount /dev/nbd0p1 "${BOOT_MOUNT}"
}

umountEFI() {
    echo "Un-mounting ${BOOTLOADER}"
  	umount "${BOOT_MOUNT}"
  	sleep 1
	  qemu-nbd --disconnect /dev/nbd0
}

# Creates a qcow image if missing and fills it with data from EFI directory.
# If you need you can create partition using `fdisk` and filesystem on the partition using `mkfs.fat`
updateEFI() {
  if [ ! -d "${BASE_DIR}" ]
  then
    echo "${VERSION} not found, creating."
    mkdir -p "${EFI_DIR}"
    own "${BASE_DIR}"
  fi
  if [ ! -f "${BOOTLOADER}" ]
  then
    echo "${VERSION} bootloader not found, creating."
    cp Bootloader.qcow2.template "${BOOTLOADER}"
    own "${BOOTLOADER}"
  fi
  if ! lsblk | grep -q nbd0
  then
    echo "nbd is disabled, enabling."
    modprobe nbd max_part=8
  fi
  mountEFI
  sudo rm -rfv "${BOOT_MOUNT}/EFI"
  sudo cp -rv "$EFI_DIR" "${BOOT_MOUNT}/EFI"
  tree "${BOOT_MOUNT}"
  umountEFI
}

"$@"
