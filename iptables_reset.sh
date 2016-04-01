#!/bin/bash

iptables -A INPUT -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT
# Drop all incoming traffic
iptables -P INPUT DROP
# Drop all forwarded traffic
iptables -P FORWARD DROP
# Allow all outgoing traffic
iptables -P OUTPUT ACCEPT
# Allow returning packets
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# Allow incoming traffic on port 80 for web server
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
# Allow MySQL
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT
# Allow local traffic
iptables -A INPUT -i lo -j ACCEPT
# Allow incoming SSH on port 9927
iptables -A INPUT -p tcp -m tcp --dport 22 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 21 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 9927 -j ACCEPT
# Drop ping
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j DROP
