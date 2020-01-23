#! /bin/bash

exit 0;


# Flush all chains and reset
iptables -F
iptables -X

# Show iptables rule list with rule number
iptables -L --line-numbers

# Dropall packets by default
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Block specific source ip address
iptables -A INPUT -s 192.168.11.1/24 -J ACCEPT

# Block specific destination ip address
iptables -A OUTPUT -d 192.168.11.1/24 -J DROP

# Block all outbound traffic (exept ssh!!)
iptables -P OUTPUT DROP
iptables -A INPUT -p tcp -s $client -d $server --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp -s $server --sport 22 -d $client -j ACCEPT

# For webserver
iptables -A INPUT -p TCP --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT

# loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Delete iptables rule with rule number
iptables -D INPUT 1
