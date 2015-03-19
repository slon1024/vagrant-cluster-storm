VAGRANTFILE_API_VERSION = "2"

hosts = {
  "alpha" => {ip: "10.77.1.2", ram: "2048", cpus: "2", ports: {}},
  "beta"  => {ip: "10.77.1.3", ram: "1024", cpus: "2", ports: {}},
  "gamma" => {ip: "10.77.1.4", ram: "1024", cpus: "2", ports: {}},
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |vagrant_config|
  hosts.each do |name, params|
    vagrant_config.vm.define name do |config|
      config.vm.box = "ubuntu/trusty64"

      config.vm.network :private_network, ip: params[:ip]

      params[:ports].each do |guest, host|
        config.vm.network :forwarded_port, guest: guest, host: host
      end

      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", params[:ram]]
        vb.customize ["modifyvm", :id, "--cpus", params[:cpus]]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
      end

      vagrant_config.vm.provision "ansible" do |ansible|
        #ansible.verbose = "vvvv"
        ansible.limit = params[:ip]
        ansible.inventory_path = "provisionning/hosts"
        ansible.playbook = "provisionning/site.yml"
      end
    end
  end
end
