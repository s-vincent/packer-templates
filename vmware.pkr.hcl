packer {
  required_plugins {
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
    vmware = {
      source  = "github.com/hashicorp/vmware"
      version = "~> 1"
    }
  }
}

variable "box_version" {
  type    = string
  default = "${env("BOX_VERSION")}"
}

source "vmware-iso" "alma10-vmware" {
  boot_command           = ["<wait><up><wait>e<down><wait><down><wait><end> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma10.ks <leftCtrlOn>x<leftCtrlOff>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
  cpus                   = 2
  disk_size              = 131072
  disk_type_id           = "0"
  guest_os_type          = "centos-64"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:68a9e14fa252c817d11a3c80306e5a21b2db37c21173fd3f52a9eb6ced25a4a0"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/10.1/isos/x86_64/AlmaLinux-10.1-x86_64-boot.iso"
  memory                 = 2048
  output_directory       = "output/alma10-vmware"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  skip_compaction        = false
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  #tools_upload_flavor    = "linux"
  version                = "13"
  vm_name                = "alma10-vmware"
  vmdk_name              = "alma10-vmware"
  vmx_data_post = {
    cleanShutdown              = "TRUE"
    "ethernet0.startConnected" = "TRUE"
    "ethernet0.virtualDev"     = "e1000"
    "ethernet0.wakeonpcktrcv"  = "false"
    softPowerOff               = "FALSE"
    "virtualHW.version"        = "12"
  }
  vmx_remove_ethernet_interfaces = true
  vnc_bind_address               = "127.0.0.1"
  vnc_disable_password           = true
}

source "vmware-iso" "alma9-vmware" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma9.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
  cpus                   = 2
  disk_size              = 131072
  disk_type_id           = "0"
  guest_os_type          = "centos-64"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:494d09f608b325ef42899b5ce38ba1b17755a639f5558b9b98a031b0696e694a"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/9.7/isos/x86_64/AlmaLinux-9.7-x86_64-boot.iso"
  memory                 = 2048
  output_directory       = "output/alma9-vmware"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  skip_compaction        = false
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  #tools_upload_flavor    = "linux"
  version                = "13"
  vm_name                = "alma9-vmware"
  vmdk_name              = "alma9-vmware"
  vmx_data_post = {
    cleanShutdown              = "TRUE"
    "ethernet0.startConnected" = "TRUE"
    "ethernet0.virtualDev"     = "e1000"
    "ethernet0.wakeonpcktrcv"  = "false"
    softPowerOff               = "FALSE"
    "virtualHW.version"        = "12"
  }
  vmx_remove_ethernet_interfaces = true
  vnc_bind_address               = "127.0.0.1"
  vnc_disable_password           = true
}

source "vmware-iso" "debian13-vmware" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian13.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
  cpus                   = 2
  disk_size              = 131072
  disk_type_id           = "0"
  guest_os_type          = "debian12-64"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:c9f09d24b7e834e6834f2ffa565b33d6f1f540d04bd25c79ad9953bc79a8ac02"
  iso_url                = "https://cdimage.debian.org/cdimage/release/13.3.0/amd64/iso-cd/debian-13.3.0-amd64-netinst.iso"
  memory                 = 2048
  output_directory       = "output/debian13-vmware"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  skip_compaction        = false
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  #tools_upload_flavor    = "linux"
  version                = "13"
  vm_name                = "debian13-vmware"
  vmdk_name              = "debian13-vmware"
  vmx_data_post = {
    cleanShutdown              = "TRUE"
    "ethernet0.startConnected" = "TRUE"
    "ethernet0.virtualDev"     = "e1000"
    "ethernet0.wakeonpcktrcv"  = "false"
    softPowerOff               = "FALSE"
    "virtualHW.version"        = "12"
  }
  vmx_remove_ethernet_interfaces = true
  vnc_bind_address               = "127.0.0.1"
  vnc_disable_password           = true
}

source "vmware-iso" "windows11-vmware" {
  boot_command           = ["<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
  cd_files               = ["./scripts/windows11/*"]
  communicator           = "winrm"
  cpus                   = 4
  disk_adapter_type      = "nvme"
  disk_size              = 131072
  disk_type_id           = "0"
  firmware               = "efi"
  guest_os_type          = "windows11-64"
  headless               = false
  http_directory         = "http"
  iso_checksum           = "sha256:ba7928055cc68266f741629a78afb9acfbd8f469cea3f3fb3348091f2f342062"
  iso_url                = "/var/lib/libvirt/images/iso/fr-fr_windows_11_business_editions_version_25h2_updated_nov_2025_x64_dvd_6f8d8df4.iso"
  memory                 = 4096
  output_directory       = "output/windows11-vmware"
  shutdown_command       = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /quiet /shutdown /unattend:E:\\autounattend-sysprep.xml"
  shutdown_timeout       = "60m"
  skip_compaction        = false
  tools_upload_flavor    = ""
  vm_name                = "windows11-vmware"
  vmdk_name              = "windows11-vmware"
  vmx_data = {
    "sata1.present" = "TRUE"
  }
  vmx_data_post = {
    cleanShutdown              = "TRUE"
    "ethernet0.startConnected" = "TRUE"
    "ethernet0.virtualDev"     = "e1000"
    "ethernet0.wakeonpcktrcv"  = "false"
    softPowerOff               = "FALSE"
  }
  vmx_remove_ethernet_interfaces = true
  vnc_bind_address               = "127.0.0.1"
  vnc_disable_password           = true
  winrm_insecure                 = true
  winrm_password                 = "vagrant"
  winrm_timeout                  = "120m"
  winrm_use_ssl                  = true
  winrm_username                 = "Administrateur"
}

build {
  sources = ["source.vmware-iso.alma10-vmware", "source.vmware-iso.alma9-vmware", "source.vmware-iso.debian13-vmware", "source.vmware-iso.windows11-vmware"]

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["vmware-iso.alma10-vmware"]
    scripts             = [
      "scripts/alma10/network.sh",
      "scripts/alma10/dnf.sh",
      "scripts/alma10/base.sh",
      "scripts/alma10/reboot.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["vmware-iso.alma10-vmware"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma10/kernel.sh",
      "scripts/alma10/vmware.sh",
      "scripts/alma10/vagrant.sh",
      "scripts/alma10/tuning.sh",
      "scripts/alma10/sshd.sh",
      "scripts/alma10/randomness.sh",
      "scripts/alma10/cleanup.sh",
      "scripts/alma10/undnf.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["vmware-iso.alma9-vmware"]
    scripts             = [
      "scripts/alma9/network.sh",
      "scripts/alma9/dnf.sh",
      "scripts/alma9/base.sh",
      "scripts/alma9/reboot.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["vmware-iso.alma9-vmware"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma9/kernel.sh",
      "scripts/alma9/vmware.sh",
      "scripts/alma9/vagrant.sh",
      "scripts/alma9/tuning.sh",
      "scripts/alma9/sshd.sh",
      "scripts/alma9/randomness.sh",
      "scripts/alma9/updatedb.sh",
      "scripts/alma9/cleanup.sh",
      "scripts/alma9/undnf.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["vmware-iso.debian13-vmware"]
    scripts             = [
      "scripts/debian13/apt.sh",
      "scripts/debian13/network.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["vmware-iso.debian13-vmware"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/debian13/profile.sh",
      "scripts/debian13/vagrant.sh",
      "scripts/debian13/motd.sh",
      "scripts/debian13/fixtty.sh",
      "scripts/debian13/vmware.sh",
      "scripts/debian13/cleanup.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "powershell" {
    only                = ["vmware-iso.windows11-vmware"]
    scripts             = [
      "scripts/windows11/wuasrv.ps1",
      "scripts/windows11/powercfg.ps1",
      "scripts/windows11/debloat.ps1",
      "scripts/windows11/chocolatey.ps1",
      "scripts/windows11/vmware.ps1",
      "scripts/windows11/packages.ps1",
      "scripts/windows11/before-sysprep.ps1"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "windows-restart" {
    only    = ["vmware-iso.windows11-vmware"]
    timeout = "2h0m0s"
  }

  provisioner "shell" {
    except              = ["vmware-iso.windows11-vmware"]
    expect_disconnect   = "true"
    scripts             = [
      "scripts/common/motd.sh",
      "scripts/common/keys.sh",
      "scripts/common/machine.sh",
      "scripts/common/leases.sh",
      "scripts/common/localtime.sh",
      "scripts/common/zerodisk.sh",
      "scripts/common/lockout.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }


  # could not parse template for following block: "template: hcl2_upgrade:6: unexpected \"\\\\\" in operand"
  post-processors {
    post-processor "vagrant" {
      keep_input_artifact  = false
      compression_level    = 9
      include              = ["tpl/info.json"]
      output               = "output/{{split build_name \"-\" 0}}-{{split build_name \"-\" 1}}-${var.box_version}.box"
      vagrantfile_template = "tpl/{{split build_name \"-\" 0}}.rb"
    }
    post-processor "checksum" {
      keep_input_artifact = false
      checksum_types      = ["sha256"]
      output              = "output/{{split build_name \"-\" 0}}-{{split build_name \"-\" 1}}-${var.box_version}.box.sha256"
    }
  }
}
