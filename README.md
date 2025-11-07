# packer-templates

Basic Packer templates for Vagrant boxes (libvirt/virtualbox/vmware flavors).

This project starts from robox repo as a base which was simplified for my needs.

Vagrant boxes are availables at
https://portal.cloud.hashicorp.com/vagrant/discover/svincent/

## Requirements

To build VM images, packer >= 1.14 is needed.

It needs also some Packer plugins.
Use `extra/install_plugins.sh` to install the required ones.

## Usage

./build.sh <os-hypervisor>

Examples:

```
./build.sh debian13-libvirt
./build.sh alma10-virtualbox
./build.sh windows11-vmware
```

## GNU/Linux templates

We propose following GNU/Linux distributions:
- Debian 13;
- AlmaLinux 9;
- AlmaLinux 10.

## Windows templates

We propose following Windows OS:
- Windows 11 Pro 25H2.

Notes:
- for libvirt build, copy virtio-win ISO files to virtio-win/ directory;
- installing OpenSSH.Server with Add-WindowsCapability takes long time
(see https://www.elevenforum.com/t/why-is-openssh-an-optional-feature-and-takes-ages-to-install-add-optional-feature.37224/) so we use directly OpenSH-Win64 MSI package.

## Links

* https://developer.hashicorp.com/packer
* https://developer.hashicorp.com/vagrant
* https://github.com/lavabit/robox
* https://github.com/gusztavvargadr/packer

