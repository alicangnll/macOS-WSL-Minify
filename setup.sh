#!/bin/bash
sudo apt update && sudo apt -y upgrade
sudo apt -y install build-essential libncurses-dev bison flex libssl-dev libelf-dev cpu-checker qemu-kvm aria2 bc
sudo apt-get install qemu-system qemu-utils python3 python3-pip -y
cd ~
aria2c -x 10 https://github.com/microsoft/WSL2-Linux-Kernel/archive/linux-msft-wsl-5.15.153.1.tar.gz
tar -xf WSL2-Linux-Kernel-linux-msft-wsl-5.15.153.1.tar.gz
cd WSL2-Linux-Kernel-linux-msft-wsl-5.15.153.1/
cp Microsoft/config-wsl .config
make menuconfig
sudo apt-get install qemu-system qemu-utils python3 python3-pip -y  # for Ubuntu, Debian, Mint, and PopOS.
(ls macOS.qcow2 >> /dev/null 2>&1 && echo "") || qemu-img create -f qcow2 ../macOS.qcow2 100G
./fetch-macOS-v2.py
(ls RecoveryImage.dmg >> /dev/null 2>&1 && mv RecoveryImage.dmg BaseSystem.dmg) || echo ""
qemu-img convert BaseSystem.dmg -O raw BaseSystem.img
echo "Success! You can run start_installation_basic.sh or start_installation_virtio.sh"