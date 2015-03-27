#!/bin/bash

vagrant destroy -f

vagrant up --no-provision

for file in $(ls provisionning/host_vars); do
  host_name=$(cat "provisionning/host_vars/${file}" | head -1 | awk '{ print $2 }')
  vagrant provision $host_name
done
