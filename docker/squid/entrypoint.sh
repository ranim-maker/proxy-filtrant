#!/bin/sh
mkdir -p /var/log/squid /var/spool/squid /var/www
chown -R proxy:proxy /var/log/squid /var/spool/squid /var/log/squidguard
touch /var/log/squid/access.log /var/log/squid/cache.log
chown proxy:proxy /var/log/squid/*.log
# Page de blocage servie sur le port 8081
cp /blocked.html /var/www/blocked.html
(cd /var/www && python3 -m http.server 8081 >/dev/null 2>&1 &)
squid -N -z
tail -F /var/log/squid/access.log /var/log/squid/cache.log &
exec squid -N -d 1
