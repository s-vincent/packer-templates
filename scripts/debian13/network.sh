#!/bin/bash -x

retry() {
  local COUNT=1
  local DELAY=0
  local RESULT=0
  while [[ "${COUNT}" -le 10 ]]; do
    [[ "${RESULT}" -ne 0 ]] && {
      [ "`which tput 2> /dev/null`" != "" ] && [ -n "$TERM" ] && tput setaf 1
      echo -e "\n${*} failed... retrying ${COUNT} of 10.\n" >&2
      [ "`which tput 2> /dev/null`" != "" ] && [ -n "$TERM" ] && tput sgr0
    }
    "${@}" && { RESULT=0 && break; } || RESULT="${?}"
    COUNT="$((COUNT + 1))"

    # Increase the delay with each iteration.
    DELAY="$((DELAY + 10))"
    sleep $DELAY
  done

  [[ "${COUNT}" -gt 10 ]] && {
    [ "`which tput 2> /dev/null`" != "" ] && [ -n "$TERM" ] && tput setaf 1
    echo -e "\nThe command failed 10 times.\n" >&2
    [ "`which tput 2> /dev/null`" != "" ] && [ -n "$TERM" ] && tput sgr0
  }

  return "${RESULT}"
}


# To allow for automated installs, we disable interactive configuration steps.
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# Set the hostname, and then ensure it will resolve properly.
printf "debian13.localdomain\n" > /etc/hostname
printf "\n127.0.0.1 debian13.localdomain\n\n" >> /etc/hosts

# Clear out the existing automatic ifup rules.
sed -i -e '/^auto/d' /etc/network/interfaces
sed -i -e '/^iface/d' /etc/network/interfaces
sed -i -e '/^allow-hotplug/d' /etc/network/interfaces

# Ensure the loopback, and default network interface are automatically enabled and then dhcp'ed.
printf "allow-hotplug eth0\n" >> /etc/network/interfaces
printf "auto lo\n" >> /etc/network/interfaces
printf "iface lo inet loopback\n" >> /etc/network/interfaces
printf "iface eth0 inet dhcp\n" >> /etc/network/interfaces
#printf "dns-nameserver 4.2.2.1\n" >> /etc/network/interfaces
#printf "dns-nameserver 4.2.2.2\n" >> /etc/network/interfaces
#printf "dns-nameserver 208.67.220.220\n" >> /etc/network/interfaces

# Adding a delay so dhclient will work properly.
printf "pre-up sleep 2\n" >> /etc/network/interfaces

# Ensure a nameserver is being used that won't return an IP for non-existent domain names.
#printf "nameserver 4.2.2.1\nnameserver 4.2.2.2\nnameserver 208.67.220.220\n" > /etc/resolv.conf

# Install netplug so we can monitor and auto-configure nics.
retry apt-get --assume-yes install netplug resolvconf

# Ensure the networking interfaces get configured on boot.
systemctl enable networking.service

# Ensure a sane DNSS configuration.
systemctl enable resolvconf.service

# Reboot onto the new kernel (if applicable).
(shutdown -r +1) &
exit 0

