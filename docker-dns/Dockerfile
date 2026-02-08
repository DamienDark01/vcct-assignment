# Specify OS and version
FROM ubuntu:22.04

# Install BIND9 DNS server and utilities
RUN apt update && apt install -y bind9 dnsutils isc-dhcp-client

# Copy config files
COPY resolv.conf /etc/resolv.conf
COPY named.conf.local /etc/bind/named.conf.local
COPY named.conf.options /etc/bind/named.conf.options
COPY db.vcct.com /etc/bind/db.vcct.com
COPY db.8.168.192 /etc/bind/db.8.168.192

# Open UDP traffic in port 53
EXPOSE 53/udp
EXPOSE 68/udp

# Start DNS server in foreground with mentioned config file
CMD ["named", "-g", "-c", "/etc/bind/named.conf"]
