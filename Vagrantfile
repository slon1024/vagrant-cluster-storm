# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

hosts = {
  "alpha" => {ip: "10.77.1.2", ram: "512", cpus: "1", ports: {}},
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant_config|
  hosts.each do |name, params|
    vagrant_config.vm.define name do |config|
      config.vm.box = "13.04_amd64"
      config.vm.box_url = "http://goo.gl/ceHWg"

      config.vm.network :private_network, ip: params[:ip]

      params[:ports].each do |guest, host|
        config.vm.network :forwarded_port, guest: guest, host: host
      end

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", params[:ram]]
        vb.customize ["modifyvm", :id, "--cpus", params[:cpus]]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
      end
    end
  end
end
