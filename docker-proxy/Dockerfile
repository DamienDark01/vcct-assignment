# Specify OS and version
FROM ubuntu:22.04

# Install Squid
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy config file
COPY squid.conf /etc/squid/squid.conf

# Copy script file and set permissions
COPY start.sh /sbin/start.sh
RUN chmod 755 /sbin/start.sh

# Open network traffic via port 3128
EXPOSE 3128

# Run Squid via script
ENTRYPOINT ["/sbin/start.sh"]
