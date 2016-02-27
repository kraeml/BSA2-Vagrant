echo "SSH Zugang über privates Netzwerk einrichten"
cat /vagrant/ssh-config/id_rsa_insecure_rdf.pub >> /home/vagrant/.ssh/authorized_keys
