#!/bin/bash
# See: http://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
declare -A CONFIG_VARS=( \
  ["DEFAULT_LEASE_TIME"]="86400" \
  ["MAX_LEASE_TIME"]="86400" \
  ["BROADCAST_ADRESS"]="192.168.33.255" \
  ["SUBNET_MASK"]="255.255.255.0" \
  ["ROUTERS"]="192.168.33.2" \
  ["DOMAINNAME_SERVERS"]="192.168.33.2" \
  ["DOMAIN_NAME"]="gxy.rdf.loc" \
  ["SUB_NET"]="192.168.33.0" \
  ["NETMASK"]="255.255.255.0" \
  ["RANGE"]="192.168.33.10\ 192.168.33.20" \
  ["_PC1"]="pluto" \
  ["PC1_HW_ETH"]="08:00:27:2C:C2:31" \
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
