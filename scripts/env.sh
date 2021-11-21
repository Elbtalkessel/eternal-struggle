#!/bin/sh
# shellcheck disable=SC2034

CPU_OPTIONS="Penryn,kvm=on,vendor=GenuineIntel,+invtsc,vmware-cpuid-freq=on,+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"

ALLOCATED_RAM="8192" # MiB
CPU_SOCKETS="1"
CPU_CORES="4"
CPU_THREADS="8"

OS="${OS:-Catalina}"
BASE_DIR="../$OS"

EFI_DIR="$BASE_DIR/EFI"
BOOTLOADER="$BASE_DIR/OpenCore.qcow2"
INSTALLER="$BASE_DIR/BaseSystem.img"
SYSTEM="$BASE_DIR/System.qcow2"
OVMF_CODE="../firmware/OVMF_CODE_PATCHED.fd"
OVMF_VARS="$BASE_DIR/OVMF_VARS-1024x768.fd"
BOOT_MOUNT="/media"

OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
