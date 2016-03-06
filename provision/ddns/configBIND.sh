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

sudo cp /vagrant/provision/ddns/files/db.empty /etc/bind/db.${CONFIG_VARS["_DOMAIN"]}
for config in "${!CONFIG_VARS[@]}"
do
  #config_data=
  #echo $config - $config_data
  sed -i s/"$config"/"${CONFIG_VARS["$config"]}"/  /etc/bind/db.${CONFIG_VARS["_DOMAIN"]}
done
echo -e "${CONFIG_VARS["_DNSNAME"]}\t\tA\t${CONFIG_VARS["_DNS_IP"]}" >> /etc/bind/db.${CONFIG_VARS["_DOMAIN"]}

sudo cp /vagrant/provision/ddns/files/db.empty /etc/bind/db.${CONFIG_VARS["_REVERSEDOMAIN"]}
for config in "${!CONFIG_VARS[@]}"
do
  #config_data=
  #echo $config - $config_data
  sed -i s/"$config"/"${CONFIG_VARS["$config"]}"/  /etc/bind/db.${CONFIG_VARS["_REVERSEDOMAIN"]}
done
echo -e "${CONFIG_VARS["_DNS_REVIP"]}\t\tPTR\t${CONFIG_VARS["ZONE_ORIGIN"]}" >> /etc/bind/db.${CONFIG_VARS["_REVERSEDOMAIN"]}

printf "zone \"%s\" {\n" ${CONFIG_VARS["_DOMAIN"]} >> /etc/bind/named.conf.local
printf "\ttype master;\n"  >> /etc/bind/named.conf.local
printf "\tfile \"/etc/bind/db.%s\";\n" ${CONFIG_VARS["_DOMAIN"]} >> /etc/bind/named.conf.local
printf "};\n\n" >> /etc/bind/named.conf.local

printf "zone \"%s\" {\n" ${CONFIG_VARS["_REVERSEDOMAIN"]} >> /etc/bind/named.conf.local
printf "\ttype master;\n"  >> /etc/bind/named.conf.local
printf "\tfile \"/etc/bind/db.%s\";\n" ${CONFIG_VARS['_REVERSEDOMAIN']} >> /etc/bind/named.conf.local
printf "};\n" >> /etc/bind/named.conf.local

sudo service bind9 restart
