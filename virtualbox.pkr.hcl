packer {
  required_plugins {
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = "~> 1"
    }
  }
}

variable "box_version" {
  type    = string
  default = "${env("BOX_VERSION")}"
}

source "virtualbox-iso" "alma10-virtualbox" {
  boot_command            = ["<wait><up><wait>e<down><wait><down><wait><end> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma10.ks <leftCtrlOn>x<leftCtrlOff>"]
  boot_keygroup_interval  = "1s"
  boot_wait               = "20s"
  cpus                    = 2
  disk_size               = 131072
  guest_additions_mode    = "upload"
  guest_additions_path    = "VBoxGuestAdditions.iso"
  guest_additions_sha256  = "66fa60b041fcda5d8b2ed22ba91bfafafaa3a5ff05c7d8ba01fbbe639669e153"
  guest_additions_url     = "https://download.virtualbox.org/virtualbox/7.2.4/VBoxGuestAdditions_7.2.4.iso"
  guest_os_type           = "RedHat_64"
  hard_drive_interface    = "sata"
  headless                = true
  http_directory          = "http"
  iso_checksum            = "sha256:a1549729bfb66a28e3546c953033c9928eae7280917bb1c490983dba3bb9941c"
  iso_url                 = "https://dfw.mirror.rackspace.com/almalinux/10.0/isos/x86_64/AlmaLinux-10.0-x86_64-boot.iso"
  memory                  = 2048
  output_directory        = "output/alma10-virtualbox"
  shutdown_command        = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts  = 1000
  ssh_password            = "vagrant"
  ssh_port                = 22
  ssh_timeout             = "3600s"
  ssh_username            = "root"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--vram", "64"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/SSE4.1", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/SSE4.2", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/POPCNT", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/CMPXCHG16B", "1"]]
  virtualbox_version_file = "VBoxVersion.txt"
  vm_name                 = "alma10-virtualbox"
  vrdp_bind_address       = "127.0.0.1"
  vrdp_port_max           = 12000
  vrdp_port_min           = 11000
}

source "virtualbox-iso" "alma9-virtualbox" {
  boot_command            = ["<tab> net.ifnames=0 inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/alma9.ks vga=792 <enter><wait>"]
  boot_keygroup_interval  = "1s"
  boot_wait               = "20s"
  cpus                    = 2
  disk_size               = 131072
  guest_additions_mode    = "upload"
  guest_additions_path    = "VBoxGuestAdditions.iso"
  guest_additions_sha256  = "66fa60b041fcda5d8b2ed22ba91bfafafaa3a5ff05c7d8ba01fbbe639669e153"
  guest_additions_url     = "https://download.virtualbox.org/virtualbox/7.2.4/VBoxGuestAdditions_7.2.4.iso"
  guest_os_type           = "RedHat_64"
  hard_drive_interface    = "sata"
  headless                = true
  http_directory          = "http"
  iso_checksum            = "sha256:113521ec7f28aa4ab71ba4e5896719da69a0cc46cf341c4ebbd215877214f661"
  iso_url                 = "https://dfw.mirror.rackspace.com/almalinux/9.6/isos/x86_64/AlmaLinux-9.6-x86_64-boot.iso"
  memory                  = 2048
  output_directory        = "output/alma9-virtualbox"
  shutdown_command        = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts  = 1000
  ssh_password            = "vagrant"
  ssh_port                = 22
  ssh_timeout             = "3600s"
  ssh_username            = "root"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--vram", "64"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/SSE4.1", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/SSE4.2", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/POPCNT", "1"], ["setextradata", "{{ .Name }}", "VBoxInternal/CPUM/IsaExts/CMPXCHG16B", "1"]]
  virtualbox_version_file = "VBoxVersion.txt"
  vm_name                 = "alma9-virtualbox"
  vrdp_bind_address       = "127.0.0.1"
  vrdp_port_max           = 12000
  vrdp_port_min           = 11000
}

source "virtualbox-iso" "debian13-virtualbox" {
  boot_command            = ["<esc><wait><esc><wait><esc><wait><esc><wait><esc><wait><esc><wait>", "/install.amd/vmlinuz auto=true priority=critical vga=788 initrd=/install.amd/gtk/initrd.gz --- quiet ", "ipv6.disable_ipv6=1 net.ifnames=0 biosdevname=0 preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/debian13.cfg ", "<enter>"]
  boot_keygroup_interval  = "1s"
  boot_wait               = "10s"
  cpus                    = 2
  disk_size               = 131072
  guest_additions_mode    = "upload"
  guest_additions_path    = "VBoxGuestAdditions.iso"
  guest_additions_sha256  = "66fa60b041fcda5d8b2ed22ba91bfafafaa3a5ff05c7d8ba01fbbe639669e153"
  guest_additions_url     = "https://download.virtualbox.org/virtualbox/7.2.4/VBoxGuestAdditions_7.2.4.iso"
  guest_os_type           = "Debian_64"
  hard_drive_interface    = "sata"
  headless                = true
  http_directory          = "http"
  iso_checksum            = "sha256:658b28e209b578fe788ec5867deebae57b6aac5fce3692bbb116bab9c65568b3"
  iso_url                 = "https://cdimage.debian.org/cdimage/release/13.1.0/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso"
  memory                  = 2048
  output_directory        = "output/debian13-virtualbox"
  shutdown_command        = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_handshake_attempts  = 1000
  ssh_password            = "vagrant"
  ssh_port                = 22
  ssh_timeout             = "3600s"
  ssh_username            = "root"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--vram", "64"]]
  virtualbox_version_file = "VBoxVersion.txt"
  vm_name                 = "debian13-virtualbox"
  vrdp_bind_address       = "127.0.0.1"
  vrdp_port_max           = 12000
  vrdp_port_min           = 11000
}

source "virtualbox-iso" "windows11-virtualbox" {
  boot_command            = ["<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>", "<enter><wait>"]
  boot_keygroup_interval  = "1s"
  boot_wait               = "1s"
  cd_files                = ["./scripts/windows11/*"]
  communicator            = "winrm"
  cpus                    = 4
  disk_size               = 131072
  firmware                = "efi"
  guest_additions_mode    = "disable"
  guest_additions_path    = "VBoxGuestAdditions.iso"
  guest_additions_sha256  = "66fa60b041fcda5d8b2ed22ba91bfafafaa3a5ff05c7d8ba01fbbe639669e153"
  guest_additions_url     = "https://download.virtualbox.org/virtualbox/7.2.4/VBoxGuestAdditions_7.2.4.iso"
  guest_os_type           = "Windows11_64"
  hard_drive_interface    = "sata"
  headless                = true
  http_directory          = "http"
  iso_checksum            = "sha256:0e736fd016778529c540e7064f53ce88c380ac7c6b3e3ce3eadb3a9887d7e6b2"
  iso_interface           = "sata"
  iso_url                 = "/var/lib/libvirt/images/iso/fr-fr_windows_11_business_editions_version_25h2_x64_dvd_f18ebec2.iso"
  memory                  = 4096
  output_directory        = "output/windows11-virtualbox"
  shutdown_command        = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /quiet /shutdown /unattend:E:\\autounattend-sysprep.xml"
  shutdown_timeout        = "60m"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--vram", "64"]]
  virtualbox_version_file = "VBoxVersion.txt"
  vm_name                 = "windows11-virtualbox"
  vrdp_bind_address       = "127.0.0.1"
  vrdp_port_max           = 12000
  vrdp_port_min           = 11000
  winrm_insecure          = true
  winrm_password          = "vagrant"
  winrm_timeout           = "120m"
  winrm_use_ssl           = true
  winrm_username          = "Administrateur"
}

build {
  sources = ["source.virtualbox-iso.alma10-virtualbox", "source.virtualbox-iso.alma9-virtualbox", "source.virtualbox-iso.debian13-virtualbox", "source.virtualbox-iso.windows11-virtualbox"]

  provisioner "shell" {
    execute_command     = "{{ .Vars }} /bin/bash '{{ .Path }}'"
    expect_disconnect   = "true"
    only                = ["virtualbox-iso.alma10-virtualbox"]
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
    only                = ["virtualbox-iso.alma10-virtualbox"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma10/kernel.sh",
      "scripts/alma10/virtualbox.sh",
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
    only                = ["virtualbox-iso.alma9-virtualbox"]
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
    only                = ["virtualbox-iso.alma9-virtualbox"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/alma9/kernel.sh",
      "scripts/alma9/virtualbox.sh",
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
    only                = ["virtualbox-iso.debian13-virtualbox"]
    scripts             = [
      "scripts/debian13/apt.sh",
      "scripts/debian13/network.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "shell" {
    expect_disconnect   = "true"
    only                = ["virtualbox-iso.debian13-virtualbox"]
    pause_before        = "2m0s"
    scripts             = [
      "scripts/debian13/profile.sh",
      "scripts/debian13/vagrant.sh",
      "scripts/debian13/motd.sh",
      "scripts/debian13/fixtty.sh",
      "scripts/debian13/virtualbox.sh",
      "scripts/debian13/cleanup.sh"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "powershell" {
    only                = ["virtualbox-iso.windows11-virtualbox"]
    scripts             = [
      "scripts/windows11/wuasrv.ps1",
      "scripts/windows11/powercfg.ps1",
      "scripts/windows11/debloat.ps1",
      "scripts/windows11/chocolatey.ps1",
      "scripts/windows11/virtualbox.ps1",
      "scripts/windows11/packages.ps1",
      "scripts/windows11/before-sysprep.ps1"
    ]
    start_retry_timeout = "15m"
    timeout             = "2h0m0s"
  }

  provisioner "windows-restart" {
    only    = ["virtualbox-iso.windows11-virtualbox"]
    timeout = "2h0m0s"
  }

  provisioner "shell" {
    except              = ["virtualbox-iso.windows11-virtualbox"]
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
