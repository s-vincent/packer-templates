packer {
  required_plugins {
    qemu = {
      source  = "github.com/hashicorp/qemu"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
  }
}

variable "box_version" {
  type    = string
  default = "${env("BOX_VERSION")}"
}

source "qemu" "alma10-libvirt" {
  boot_command           = ["<wait><up><wait>e<down><wait><down><wait><end> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma10.ks <leftCtrlOn>x<leftCtrlOff>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
  cpus                   = 2
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio-scsi"
  disk_size              = "131072"
  format                 = "qcow2"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:68a9e14fa252c817d11a3c80306e5a21b2db37c21173fd3f52a9eb6ced25a4a0"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/10.1/isos/x86_64/AlmaLinux-10.1-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/alma10-libvirt"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "alma10-libvirt"
}

source "qemu" "alma9-libvirt" {
  boot_command           = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma9.ks vga=792 <enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "20s"
  cpus                   = 2
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio-scsi"
  disk_size              = "131072"
  format                 = "qcow2"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:494d09f608b325ef42899b5ce38ba1b17755a639f5558b9b98a031b0696e694a"
  iso_url                = "https://dfw.mirror.rackspace.com/almalinux/9.7/isos/x86_64/AlmaLinux-9.7-x86_64-boot.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/alma9-libvirt"
  qemu_binary            = "qemu-system-x86_64"
  qemuargs               = [["-cpu", "max"]]
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "alma9-libvirt"
}

source "qemu" "debian13-libvirt" {
  boot_command           = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian13.cfg ", "<enter>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "10s"
  cpus                   = 2
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio-scsi"
  disk_size              = "131072"
  format                 = "qcow2"
  headless               = true
  http_directory         = "http"
  iso_checksum           = "sha256:c9f09d24b7e834e6834f2ffa565b33d6f1f540d04bd25c79ad9953bc79a8ac02"
  iso_url                = "https://cdimage.debian.org/cdimage/release/13.3.0/amd64/iso-cd/debian-13.3.0-amd64-netinst.iso"
  memory                 = 2048
  net_device             = "virtio-net"
  output_directory       = "output/debian13-libvirt"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts = 1000
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "3600s"
  ssh_username           = "root"
  vm_name                = "debian13-libvirt"
}

source "qemu" "windows11-libvirt" {
  boot_command           = ["<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>"]
  boot_keygroup_interval = "1s"
  boot_wait              = "1s"
  cd_files               = ["./scripts/windows11/*", "./virtio-win/*"]
  communicator           = "winrm"
  cpu_model              = "host"
  cpus                   = 4
  disk_cache             = "unsafe"
  disk_compression       = true
  disk_detect_zeroes     = "on"
  disk_discard           = "unmap"
  disk_image             = false
  disk_interface         = "virtio-scsi"
  disk_size              = "131072"
  efi_boot               = true
  efi_firmware_code      = "/usr/share/OVMF/OVMF_CODE_4M.fd"
  efi_firmware_vars      = "/usr/share/OVMF/OVMF_VARS_4M.fd"
  format                 = "qcow2"
  headless               = false
  http_directory         = "http"
  iso_checksum           = "sha256:ba7928055cc68266f741629a78afb9acfbd8f469cea3f3fb3348091f2f342062"
  iso_url                = "/var/lib/libvirt/images/iso/fr-fr_windows_11_business_editions_version_25h2_updated_nov_2025_x64_dvd_6f8d8df4.iso"
  machine_type           = "q35"
  memory                 = 4096
  net_device             = "virtio-net"
  output_directory       = "output/windows11-libvirt"
  qemu_binary            = "qemu-system-x86_64"
  shutdown_command       = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /quiet /shutdown /unattend:E:\\autounattend-sysprep.xml"
  shutdown_timeout       = "60m"
  vm_name                = "windows11-libvirt"
  vtpm                   = true
  winrm_insecure         = true
  winrm_password         = "vagrant"
  winrm_timeout          = "120m"
  winrm_use_ssl          = true
  winrm_username         = "Administrateur"
}

build {
  sources = ["source.qemu.alma10-libvirt", "source.qemu.alma9-libvirt", "source.qemu.debian13-libvirt", "source.qemu.windows11-libvirt"]

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["qemu.alma10-libvirt"]
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
    only                = ["qemu.alma10-libvirt"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma10/kernel.sh",
      "scripts/alma10/qemu.sh",
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
    only                = ["qemu.alma9-libvirt"]
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
    only                = ["qemu.alma9-libvirt"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma9/kernel.sh",
      "scripts/alma9/qemu.sh",
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
    only                = ["qemu.debian13-libvirt"]
    scripts             = ["scripts/debian13/apt.sh", "scripts/debian13/network.sh"]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["qemu.debian13-libvirt"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/debian13/profile.sh",
      "scripts/debian13/vagrant.sh",
      "scripts/debian13/motd.sh",
      "scripts/debian13/fixtty.sh",
      "scripts/debian13/qemu.sh",
      "scripts/debian13/cleanup.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "powershell" {
    only                = ["qemu.windows11-libvirt"]
    scripts             = [
      "scripts/windows11/wuasrv.ps1",
      "scripts/windows11/powercfg.ps1",
      "scripts/windows11/debloat.ps1",
      "scripts/windows11/chocolatey.ps1",
      "scripts/windows11/libvirt.ps1",
      "scripts/windows11/packages.ps1",
      "scripts/windows11/before-sysprep.ps1"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "windows-restart" {
    only    = ["qemu.windows11-libvirt"]
    timeout = "2h0m0s"
  }

  provisioner "shell" {
    except              = ["qemu.windows11-libvirt"]
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
