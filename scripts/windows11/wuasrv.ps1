# Disable Windows update
Set-Service -Name "wuauserv" -Status Stopped
Set-Service -Name "wuauserv" -StartupType Disabled
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name NoAutoUpdate -Value 1

