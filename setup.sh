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


VAGRANT_VERSION=$(vagrant --version | awk '{ print $2 }')
REQUIRED_VAGRANT_VERSION="1.5.2"
check_version "vagrant" $VAGRANT_VERSION $REQUIRED_VAGRANT_VERSION


vagrant destroy -f
vagrant up --no-provision
vagrant provision