#!/bin/bash
cd /home/vagrant
dnssec-keygen -a HMAC-MD5 -b 128 -n USER DHCP_UPDATER
grep Key *.private >> ddns.key
sed -i '1ikey DHCP_UPDATER {' ddns.key
sed -i '2i\ \ \ \ \ \ \ algorithm HMAC-MD5.SIG-ALG.REG.INT;' ddns.key
sed -i s/Key:\ /\ \ \ \ \ \ \ secret\ \"/ ddns.key
sed -i s/=$/=\"\;/ ddns.key
sed -i '3a};' ddns.key
rm K*
