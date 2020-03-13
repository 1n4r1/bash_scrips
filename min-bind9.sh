#!/bin/bash

cat << "EOF" > /etc/bind/named.conf.local
zone "mydomain.com" IN {
  type master;
  file "/etc/bind/mydomain.com.zone";
};
EOF

cat << "EOF" > /etc/bind/mydomain.com.zone
$TTL 86400
@ IN SOA mydomain.com root.mydomain.com (
  2018050600
  3600
  900
  604800
  86400
)
@      IN NS server
server IN A  192.168.10.2
@ IN A 192.168.10.1
* IN A 192.168.10.1
EOF
