#!/bin/bash
echo "Netzwerk für Vagrant abschalten"
sudo /bin/sed -i 's/^auto eth0/\# auto eth0/g' /etc/network/interfaces
