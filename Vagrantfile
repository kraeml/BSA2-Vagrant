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
    vb.linked_clone = true
  end

  # Alle Maschinen führen diese Shellskripte aus.
  # Netzwerk für eth0 abschalten
  config.vm.provision "shell", path: "./provision/network.sh"
  # Denn ssh-user einrichten
  config.vm.provision "shell", path: "./provision/ssh-user.sh"

  # Das Gateway
  config.vm.define "gw" do | gw |
    gw.vm.hostname = "gw"
    # Bitte in hosts eintragen.
    # 192.168.50.40 ubuntu_itec ubuntu_itec
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

    gw.vm.provision "shell", path: "./provision/gw/sshd_config.sh"
    gw.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_gw.rdf"
    end
  end

  # Der erste Client
  config.vm.define "pc1" do | pc1 |
    pc1.vm.hostname = "pc1"
    # Das Blaue Netzwerk
    pc1.vm.network "private_network",
     ip: "192.168.33.3",
     virtualbox__intnet: "Blau"

    pc1.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_pc1.rdf"
    end
  end

  # Der zweit Client
  config.vm.define "pc2" do | pc2 |
    pc2.vm.hostname = "pc2"
    # Das Blaue Netzwerk
    pc2.vm.network "private_network",
     ip: "192.168.33.4",
     virtualbox__intnet: "Blau"

    pc2.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_pc2.rdf"
    end
  end

  # Der dritte Client
  config.vm.define "pc3" do | pc3 |
    pc3.vm.hostname = "pc3"
    # Das Blaue Netzwerk
    pc3.vm.network "private_network",
     ip: "192.168.33.5",
     virtualbox__intnet: "Blau"

    pc3.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_pc3.rdf"
    end
  end

  # Der vierte Client
  config.vm.define "pc4" do | pc4 |
    pc4.vm.hostname = "pc4"
    # Das Blaue Netzwerk
    pc4.vm.network "private_network",
     ip: "192.168.33.6",
     virtualbox__intnet: "Blau"

    pc4.vm.provider "virtualbox" do |vb|
      vb.name = "ubuntu_bsa_pc4.rdf"
    end
  end
end
