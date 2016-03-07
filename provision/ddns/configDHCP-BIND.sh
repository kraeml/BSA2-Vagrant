#!/bin/bash
sudo sed -i '4iddns-update-style interim;' /etc/dhcp/dhcpd.conf
sudo sed -i '5iddns-domainname \"gxy.rdf.loc\"\;' /etc/dhcp/dhcpd.conf
sudo sed -i '6iignore client-updates;' /etc/dhcp/dhcpd.conf
sudo sed -i '7iupdate-static-leases on;' /etc/dhcp/dhcpd.conf
sudo sed -i '3iinclude "/etc/dhcp/ddns.key";' /etc/dhcp/dhcpd.conf

sudo sed -i '18izone gxy.rdf.loc. {' /etc/dhcp/dhcpd.conf
sudo sed -i '19i\ \ \ \ primary 127.0.0.1;' /etc/dhcp/dhcpd.conf
sudo sed -i '20i\ \ \ \ key DHCP_UPDATER;' /etc/dhcp/dhcpd.conf
sudo sed -i '21i}' /etc/dhcp/dhcpd.conf

sudo sed -i '22izone 33.168.192.in-addr.arpa. {' /etc/dhcp/dhcpd.conf
sudo sed -i '23i\ \ \ \ primary 127.0.0.1;' /etc/dhcp/dhcpd.conf
sudo sed -i '24i\ \ \ \ key DHCP_UPDATER;' /etc/dhcp/dhcpd.conf
sudo sed -i '25i}' /etc/dhcp/dhcpd.conf

sudo sed -i '8iinclude "/etc/bind/ddns.key";' /etc/bind/named.conf.local
sudo sed -i '13i\ \ \ \ \ \ \ \ allow-update { key "DHCP_UPDATER"; };' /etc/bind/named.conf.local
sudo sed -i '19i\ \ \ \ \ \ \ \ allow-update { key "DHCP_UPDATER"; };' /etc/bind/named.conf.local

sudo service isc-dhcp-server restart
sudo service bind9 restart
