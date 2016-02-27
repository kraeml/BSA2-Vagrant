#!/bin/bash
echo "SSH für Schnittstellen einrichten"
/bin/cp /vagrant/provision/gw/sshd_config /etc/ssh/sshd_config
/usr/sbin/service ssh reload
