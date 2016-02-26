Vagrant.configure(2) do |config|
  config.vm.box = "kraeml/ubuntu_de"
  # Bitte in hosts eintragen.
  # 192.168.50.4 ubuntu_itec ubuntu_itec
  # Somit kann mit ping ubuntu_itec bzw. http://ubuntu_itec
  # aufgerufen werden.
  config.vm.network "private_network",
   ip: "192.168.50.40"
  config.vm.network "private_network",
   ip: "192.168.33.10",
   virtualbox__intnet: "Blau"
  config.vm.network "public_network",
   bridge: "eth0",
   use_dhcp_assigned_default_route: true

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

   # Customize the amount of memory on the VM:
    vb.memory = "1024"

    vb.name = "ubuntu_bsa.rdf"
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
  end
  config.vm.provision "shell", path: "./provision/ssh-user.sh"
  config.vm.provision "shell", path: "./provision/network.sh"
end
