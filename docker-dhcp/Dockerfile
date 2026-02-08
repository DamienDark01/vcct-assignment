# Specify OS and version
FROM ubuntu:22.04

# Install ISC DHCP server
RUN apt-get update && apt-get install -y isc-dhcp-server

# Copy config files
COPY resolv.conf /etc/resolv.conf
COPY isc-dhcp-server /etc/default/isc-dhcp-server
COPY dhcpd.conf /etc/dhcp/dhcpd.conf

# Create lease files, directories, and their permissions
RUN mkdir -p /var/lib/dhcp && touch /var/lib/dhcp/dhcpd.leases
RUN chown -R dhcpd:dhcpd /var/lib/dhcp

# Open UDP traffic via port 67 for the DHCP server
EXPOSE 67/udp

# Run DHCP server in the foreground
CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
