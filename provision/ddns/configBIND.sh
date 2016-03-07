#!/bin/bash
# See: http://stackoverflow.com/questions/1494178/how-to-define-hash-tables-in-bash
declare -A CONFIG_VARS=( \
  ["_TTL"]="86400" \
  ["ZONE_ORIGIN"]="gw.gxy.rdf.loc." \
  ["ZONE_CONTACT"]="root.mail.gxy.rdf.loc." \
  ["_SERIAL"]="2" \
  ["_REFRESH"]="604800" \
  ["_RETRY"]="86400" \
  ["_EXPIRE"]="2419200" \
  ["_NEGATIV"]="86400" \
  ["_DOMAIN"]="gxy.rdf.loc" \
  ["_REVERSEDOMAIN"]="33.168.192.in-addr.arpa" \
  ["_DNSNAME"]="gw" \
  ["_DNS_IP"]="192.168.33.2" \
  ["_DNS_REVIP"]="2" \
)

for i in "_DOMAIN" "_REVERSEDOMAIN"
do
  echo $i
  # Erstellen der db-Dateien
  sudo cp /vagrant/provision/ddns/files/db.empty /etc/bind/db.${CONFIG_VARS["$i"]}
  for config in "${!CONFIG_VARS[@]}"
  do
    sed -i s/"$config"/"${CONFIG_VARS["$config"]}"/  /etc/bind/db.${CONFIG_VARS["$i"]}
  done
  # Einträge in der named.conf.local
  printf "zone \"%s\" {\n" ${CONFIG_VARS["$i"]} >> /etc/bind/named.conf.local
  printf "\ttype master;\n"  >> /etc/bind/named.conf.local
  printf "\tfile \"/var/cache/bind/db.%s\";\n" ${CONFIG_VARS["$i"]} >> /etc/bind/named.conf.local
  printf "};\n\n" >> /etc/bind/named.conf.local
done

echo -e "${CONFIG_VARS["_DNSNAME"]}\t\tA\t${CONFIG_VARS["_DNS_IP"]}" >> /etc/bind/db.${CONFIG_VARS["_DOMAIN"]}
echo -e "${CONFIG_VARS["_DNS_REVIP"]}\t\tPTR\t${CONFIG_VARS["ZONE_ORIGIN"]}" >> /etc/bind/db.${CONFIG_VARS["_REVERSEDOMAIN"]}

sudo ln -s /etc/bind/db.gxy.rdf.loc /var/cache/bind/
sudo ln -s /etc/bind/db.33.168.192.in-addr.arpa /var/cache/bind/

sudo service bind9 restart
