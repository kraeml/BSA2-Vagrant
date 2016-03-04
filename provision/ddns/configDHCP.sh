#!/bin/bash
declare -A CONFIG_VARS=( \
  ["DEFAULT_LEASE_TIME"]="86400" \
  ["MAX_LEASE_TIME"]="86400" \
  ["BROADCAST_ADRESS"]="192.168.33.255" \
  ["SUBNETMASK"]="255.255.255.255.0" \
  ["ROUTERS"]="192.168.33.2" \
  ["DOMAIN_NAME_SERVERS"]="192.168.33.2" \
  ["DOMAIN_NAME"]="test.rdf" \
  ["SUBNET"]="192.168.33.0" \
  ["NETMASK"]="255.255.255.0" \
  ["RANGE"]="192.168.33.10\ 192.168.33.20" \
  ["PC1"]="pluto" \
  ["PC1_HW_ETH"]="00:c0:ee:51:39:9f" \
  ["PC1_ADDR"]="192.168.33.254" \
  ["PC1_DEFAULT_LEASTIME"]="86400000" \
)

sudo cp /vagrant/provision/ddns/files/dhcpd.conf /etc/dhcp/dhcpd.conf
for config in "${!CONFIG_VARS[@]}"
do
  #config_data=
  #echo $config - $config_data
  sed -i s/"$config"/"${CONFIG_VARS["$config"]}"/  /etc/dhcp/dhcpd.conf
done
