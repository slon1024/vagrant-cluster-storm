#!/bin/bash


REQUIRED_VERSION_VAGRANT="1.5"
VAGRANT_VERSION=$(vagrant --version | awk '{ print $2 }')

if [ $(echo "${VAGRANT_VERSION%.*} >= ${REQUIRED_VERSION_VAGRANT}" | bc) -eq 0 ]
then
  echo "required vagrant: ${REQUIRED_VERSION_VAGRANT}+, actual is: ${VAGRANT_VERSION}"
  exit
fi

vagrant destroy -f
vagrant up --no-provision
vagrant provision
