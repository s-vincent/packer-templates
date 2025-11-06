#!/bin/sh

packer plugin install github.com/hashicorp/qemu
packer plugin install github.com/hashicorp/virtualbox
packer plugin install github.com/hashicorp/vmware
packer plugin install github.com/hashicorp/vagrant

