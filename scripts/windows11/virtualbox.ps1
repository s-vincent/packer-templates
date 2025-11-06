choco install -y virtualbox-guest-additions-guest.install

# exit code 3010 is success but reboot required
if ($LastExitCode -eq 0 -or $LastExitCode -eq 3010)
{
  exit 0
}

exit $LastExitCode

