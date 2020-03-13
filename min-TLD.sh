#!/bin/bash

# use Google public DNS only for the google.com
cat << "EOF" > /etc/bind/named.conf.local
zone "com" IN {
  type master;
  file "/etc/bind/global.zone";
};
EOF

cat << "EOF" > /etc/bind/global.zone
$TTL 86400

@ IN SOA ns.com. server.com. (
  2018050600
  3600
  900
  604800
  86400
)
@      IN NS ns.com.
google IN NS dns.google.

dns.google. IN A 8.8.8.8
dns.google. IN A 8.8.4.4
ns IN A 192.168.11.1
* IN A  192.168.11.1
EOF

