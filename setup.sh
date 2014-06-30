#!/bin/bash


check_version () {
  first=$(echo $2 | tr -d '.')
  second=$(echo $3 | tr -d '.')
  if [ $(echo "$first < $second" | bc) -eq 1 ]
  then
    echo "required $1: ${3}+, actual is: $2"
    exit
  fi
}

VIRTUALBOX_VERSION=$(virtualbox --help | head -n 1 | awk '{print $NF}')
REQUIRED_VIRTUALBOX_VERSION="4.3.8"
check_version "VirtualBox" $VIRTUALBOX_VERSION $REQUIRED_VIRTUALBOX_VERSION

VAGRANT_VERSION=$(vagrant --version | awk '{ print $2 }')
REQUIRED_VAGRANT_VERSION="1.5.1"
check_version "vagrant" $VAGRANT_VERSION $REQUIRED_VAGRANT_VERSION


vagrant destroy -f
vagrant up --no-provision
vagrant provision