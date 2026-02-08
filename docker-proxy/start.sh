#!/bin/bash

mkdir -p /var/log/squid
chmod -R 755 /var/log/squid
chown -R proxy:proxy /var/log/squid
mkdir -p /var/spool/squid
chown -R proxy:proxy /var/spool/squid

if [[ ! -d /var/spool/squid/00 ]]; then
	$(which squid) -N -f /etc/squid/squid.conf -z
fi

exec $(which squid) -f /etc/squid/squid.conf -NYCd 1
