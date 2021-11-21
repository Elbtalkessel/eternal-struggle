#!/bin/sh
# shellcheck disable=SC2034

CPU_HOST="host,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on"
CPU_PENRYN="Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"
MY_OPTIONS=$CPU_PENRYN

ALLOCATED_RAM="8192" # MiB
CPU_SOCKETS="1"
CPU_CORES="4"
CPU_THREADS="8"

VERSION="${VERSION:-Catalina}"
BASE_DIR="../$VERSION"

EFI_DIR="$BASE_DIR/EFI"
BOOTLOADER="$BASE_DIR/OpenCore.qcow2"
INSTALLER="$BASE_DIR/BaseSystem.img"
SYSTEM="$BASE_DIR/System.img"
OVMF_CODE="$BASE_DIR/OVMF_CODE.fd"
OVMF_VARS="$BASE_DIR/OVMF_VARS-1024x768.fd"
BOOT_MOUNT="/media"

OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
