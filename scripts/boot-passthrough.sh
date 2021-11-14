#!/usr/bin/env bash
set -e
source ./env.sh




# shellcheck disable=SC2054
args=(
  -enable-kvm
  -m "$ALLOCATED_RAM"
  -cpu "$MY_OPTIONS"
  -machine q35
  -usb -device usb-kbd -device usb-tablet
  -smp "$CPU_THREADS",cores="$CPU_CORES",sockets="$CPU_SOCKETS"
  -device usb-ehci,id=ehci
  -device isa-applesmc,osk="$OSK"
  -drive if=pflash,format=raw,readonly=on,file="$OVMF_CODE"
  -drive if=pflash,format=raw,file="$OVMF_VARS"
  -smbios type=2
  # Disk controllers
  -device ich9-intel-hda -device hda-duplex
  -device ich9-ahci,id=sata
  # OpenCore boot image
  -device ide-hd,bus=sata.2,drive=OpenCoreBoot
  -drive id=OpenCoreBoot,if=none,snapshot=on,format=qcow2,file="$OPEN_CORE_IMG"
  # Install media
  -device ide-hd,bus=sata.3,drive=InstallMedia
  -drive id=InstallMedia,if=none,file="$INSTALLER_IMG",format=raw
  # Disk system installed onto
  -device ide-hd,bus=sata.4,drive=MacHDD
  -drive id=MacHDD,if=none,file="$SYSTEM_IMG",format=qcow2
  # USB pci card
  -device vfio-pci,host=05:00.0,bus=pcie.0
  # Virtual display
  -monitor stdio
  -display none
  -vga none
  # GPU + GPU audio
  -device vfio-pci,host=0c:00.0,multifunction=on
  -device vfio-pci,host=0c:00.1

)

qemu-system-x86_64 "${args[@]}"
