$ProgressPreference = 'SilentlyContinue'

# Install OpenSSH server
#Add-WindowsCapability -Online -Name OpenSSH.Server
msiexec.exe /qn /i "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v9.8.3.0p2-Preview/OpenSSH-Win64-v9.8.3.0.msi"

Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

$authorizedKey = Get-Content -Path E:\vagrant.pub

Add-Content -Force -Path $env:ProgramData\ssh\administrators_authorized_keys -Value "$authorizedKey"
icacls.exe $env:ProgramData\ssh\administrators_authorized_keys /inheritance:r /grant "*S-1-5-32-544:F" /grant "SYSTEM:F"
#New-Item -Force -ItemType Directory -Path C:\Users\Vagrant\.ssh
#Add-Content -Force -Path C:\Users\Vagrant\.ssh\authorized_keys -Value "$authorizedKey"

# Adds rule to allow SSH in any profile (public, private and domain)
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22 profile=any

