#!/bin/bash

sudo apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu-system qemu-kvm python3 python3-pip

sudo apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools cpu-checker

echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs

sudo modprobe kvm

kvm-ok

echo "Gelecek verinin yanıtı Y olmalıdır"

cat /sys/module/kvm_intel/parameters/nested

sudo apt-get install qemu-system qemu-utils python3 python3-pip -y  # for Ubuntu, Debian, Mint, and PopOS.

(ls macOS.qcow2 >> /dev/null 2>&1 && echo "") || qemu-img create -f qcow2 macOS.qcow2 100G

./fetch-macOS-v2.py

(ls RecoveryImage.dmg >> /dev/null 2>&1 && mv RecoveryImage.dmg BaseSystem.dmg) || echo ""

qemu-img convert BaseSystem.dmg -O raw BaseSystem.img

echo "Success! You can run start_installation_basic.sh or start_installation_virtio.sh"
