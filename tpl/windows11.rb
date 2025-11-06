# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'fileutils'

vagrant_root = File.dirname(__FILE__)

Vagrant.configure(2) do |config|

  config.vm.boot_timeout = 1800
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.box_check_update = true

  # config.vm.post_up_message = ""
  config.vm.boot_timeout = 1800
  # config.vm.box_download_checksum = true
  config.vm.boot_timeout = 1800
  # config.vm.box_download_checksum_type = "sha256"

  # config.vm.provision "shell", run: "always", inline: <<-SHELL
  # SHELL

  # Adding a second CPU and increasing the RAM to 4096MB will speed
  # things up considerably should you decide to do anythinc with this box.
  config.vm.provider :libvirt do |v, override|
    #v.disk_bus = "virtio"
    #v.driver = "kvm"
    #v.video_vram = 256
    v.machine_type = 'q35'
    v.qemu_use_session = false
    v.memory = 4096
    v.cpus = 4
    v.loader = '/usr/share/OVMF/OVMF_CODE_4M.fd'
    #FileUtils.mkdir_p vagrant_root + '/.vagrant/machines/' + name + '/libvirt'
    #v.nvram = vagrant_root + '/.vagrant/machines/' + name + '/libvirt/OVMF_VARS_4M.fd'
    v.nvram = 'OVMF_VARS_4M.fd'
    v.video_type = 'virtio'
    v.graphics_type = 'spice'
    v.channel :type => 'unix', :target_name => 'org.qemu.guest_agent.0', :target_type => 'virtio'
    v.channel :type => 'spicevmc', :target_name => 'com.redhat.spice.0', :target_type => 'virtio'
  end

  config.vm.provider :virtualbox do |v, override|
    v.memory = 4096
    v.cpus = 4
    v.gui = true
    v.customize ["modifyvm", :id, "--vram", 256]
  end

  ["vmware_fusion", "vmware_workstation", "vmware_desktop"].each do |provider|
    config.vm.provider provider do |v, override|
      v.whitelist_verified = true
      v.gui = true
      v.linked_clone = false
      v.vmx["cpuid.coresPerSocket"] = "1"
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "4"
    end
  end
end
