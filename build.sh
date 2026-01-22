#!/bin/sh

set -e

if [ $# -lt 1 ]
then
  echo "Usage: $0 template"
  echo "Example: $0 debian13-libvirt"
  exit 1
fi

if [ ! -n "$BOX_VERSION" ]; then
  export BOX_VERSION="1.2.0"
fi

IMAGE=$1
TEMPLATE=""
BASE=$(pwd -P)

export PACKER_LOG="1"
export PACKER_LOG_PATH="$BASE/logs/$1-`date +'%Y%m%d.%H.%M.%S'`.txt"
export PACKER_CACHE_DIR="$BASE/packer_cache/"

if [ "$(uname -s)" = "Linux" ]; then
  export TMPDIR=/var/tmp
fi

case "$1" in
  *-libvirt)
    TEMPLATE="libvirt.pkr.hcl"
    ;;
  *-virtualbox)
    TEMPLATE="virtualbox.pkr.hcl"
    ;;
  *-vmware)
    TEMPLATE="vmware.pkr.hcl"
    ;;
  *)
    echo "Bad image name"
    exit 1
    ;;
esac

echo "Use file ${TEMPLATE} with builder ${IMAGE}"
packer build -only=*.${IMAGE} ${TEMPLATE}

