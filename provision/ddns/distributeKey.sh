#!/bin/bash
sudo cp ddns.key /etc/bind/
sudo cp ddns.key /etc/dhcp/

sudo chgrp dhcpd /etc/dhcp/ddns.key
sudo chmod 640 /etc/*/ddns.key

sudo rm ddns.key
