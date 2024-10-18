# macOS Virtualization on WSL

## Requirements
<ul>
  <li>100 GB+ storage</li>
  <li>At least 8 GB RAM</li>
  <li>Virtualization support</li>
</ul>

## Installation
<p>First of all, you have to install WSL.</p>

<pre>wsl --install</pre>

<p>You must create .wslconfig file in the C:/Users/YOUR_WINDOWS_USERNAME directory</p>

<pre>
[wsl2]
nestedVirtualization=true
debugConsole=true
pageReporting=true
kernelCommandLine=intel_iommu=on iommu=pt kvm.ignore_msrs=1 kvm-intel.nested=1 kvm-intel.ept=1 kvm-intel.emulate_invalid_guest_state=0 kvm-intel.enable_shadow_vmcs=1 kvm-intel.enable_apicv=1
</pre>

<p>After that, you need to run wsl and install KVM</p>

<pre>
wsl
sudo apt -y install bridge-utils cpu-checker libvirt-clients libvirt-daemon qemu-system qemu-kvm python3 python3-pip
sudo apt install qemu-system qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager libguestfs-tools cpu-checker
echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs
sudo modprobe kvm
kvm-ok
cat /sys/module/kvm_intel/parameters/nested (Y)
</pre>

<p>After that, you need to install macOS packages and run macOS Installation</p>

<pre>
./windows-install.sh
Virtualization -> Intel or AMD -> Save
./setup.sh
./start_installation_basic.sh or ./start_installation_virtio.sh
</pre>

<p> Once you have installed macOS on your disk, you need to start macOS </p>

<pre> boot_basic.sh or boot_vnc.sh </pre>

<p> NOTE : If you want to connect with VNC, you must forwarding 5900 port to other interfaces on Windows</p>
<pre>
  netsh interface portproxy add v4tov4 listenport=[PORT] listenaddress=0.0.0.0 connectport=[PORT] connectaddress=[WSL_IP] 
  Example : netsh interface portproxy add v4tov4 listenport=5900 listenaddress=0.0.0.0 connectport=5900 connectaddress=172.24.155.114
</pre>

## Pics
![Main Pic](https://github.com/user-attachments/assets/16b2d743-8786-4645-a2d4-59823333285c)

## macOS Optimizer
https://github.com/sickcodes/osx-optimizer

## XCode Installer
https://developer.apple.com/download/all/?q=xcode

## Docs
https://oneclick-macos-simple-kvm.notaperson535.is-a.dev/docs/start-here/

This project powered by <a href="https://github.com/notAperson535/OneClick-macOS-Simple-KVM">OneClick-macOS-Simple-KVM</a>
