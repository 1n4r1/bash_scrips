#! /bin/bash

# Show iptables rule list with rule number
iptables -L --line-numbers

# Block specific ip address
iptables -A INPUT -s 192.168.11.1/24 -J ACCEPT

# Delete iptables rule with rule number
iptables -D INPUT 1
