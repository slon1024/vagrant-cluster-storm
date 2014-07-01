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
check_version "virtualbox" $VIRTUALBOX_VERSION $REQUIRED_VIRTUALBOX_VERSION

VAGRANT_VERSION=$(vagrant --version | awk '{ print $2 }')
REQUIRED_VAGRANT_VERSION="1.5.1"
check_version "vagrant" $VAGRANT_VERSION $REQUIRED_VAGRANT_VERSION

PYTHON_VERSION=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:3])))')
REQUIRED_PYTHON_VERSION="2.7.5"
check_version "python" $PYTHON_VERSION $REQUIRED_PYTHON_VERSION

PIP_VERSION=$(pip --version | awk '{ print $2 }')
REQUIRED_PIP_VERSION="1.5.2"
check_version "pip" $PIP_VERSION $REQUIRED_PIP_VERSION

ANSIBLE_VERSION=$(ansible --version | awk '{ print $2 }')
REQUIRED_ANSIBLE_VERSION="1.5"
check_version "ansible" $ANSIBLE_VERSION $REQUIRED_ANSIBLE_VERSION

vagrant destroy -f
vagrant up --no-provision
vagrant provision