echo "SSH Zugang über privates Netzwerk einrichten"
cat /vagrant/ssh-config/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
