#!/bin/sh

MY_OPTIONS="+ssse3,+sse4.2,+popcnt,+avx,+aes,+xsave,+xsaveopt,check"

ALLOCATED_RAM="8192" # MiB
CPU_SOCKETS="1"
CPU_CORES="4"
CPU_THREADS="8"

REPO_PATH=".."
OVMF_DIR="ovmf"
DISKS_DIR="disks"
OPEN_CORE_DIR="oc"
EFI_DIR="$REPO_PATH/$OPEN_CORE_DIR/EFI"

OPEN_CORE_IMG="$REPO_PATH/$OPEN_CORE_DIR/OpenCore.qcow2"
INSTALLER_IMG="$REPO_PATH/$DISKS_DIR/BaseSystem.img"
SYSTEM_IMG="$REPO_PATH/$DISKS_DIR/system.img"
OVMF_CODE="$REPO_PATH/$OVMF_DIR/OVMF_CODE.fd"
OVMF_VARS="$REPO_PATH/$OVMF_DIR/OVMF_VARS-1024x768.fd"

OSK="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
