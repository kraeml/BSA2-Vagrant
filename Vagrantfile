Vagrant.configure(2) do |config|
  config.vm.box = "kraeml/ubuntu_de"
  # Falls vbguest-plugin bitte Guest nachladen
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = true
  end
  # Alle Maschinen haben folgende VirtualBox Einstellungen
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "1024"

    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
  end

  # Alle Maschinen führen diese Shellskripte aus.
  # Netzwerk für eth0 abschalten
  config.vm.provision "shell", path: "./provision/network.sh"
  # Denn ssh-user einrichten
  config.vm.provision "shell", path: "./provision/ssh-user.sh"

  # Das Gateway
  config.vm.define "gw" do | gw |
    # Bitte in hosts eintragen.
    # 192.168.50.4 ubuntu_itec ubuntu_itec
    # Somit kann mit ping ubuntu_itec bzw. http://ubuntu_itec
    # aufgerufen werden.
    gw.vm.network "private_network",
     ip: "192.168.50.40"

    # Das Blaue Netzwerk
    gw.vm.network "private_network",
     ip: "192.168.33.2",
     virtualbox__intnet: "Blau"

    # DHCP und WWW über das lokale Netz
    # Die DHCP Einstellungen werden übernommen
    gw.vm.network "public_network",
     bridge: "eth0",
     use_dhcp_assigned_default_route: true


    config.vm.provision "shell", path: "./provision/sshd_config.sh"
    config.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_gw.rdf"
    end
  end

end
