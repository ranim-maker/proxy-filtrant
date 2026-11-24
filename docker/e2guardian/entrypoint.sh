#!/bin/sh
CONF=/etc/e2guardian/e2guardian.conf
sed -i "s|^proxyip.*|proxyip = ${PROXY_IP:-127.0.0.1}|" $CONF
sed -i "s|^proxyport.*|proxyport = ${PROXY_PORT:-3128}|" $CONF
mkdir -p /var/log/e2guardian
chown -R e2guardian:e2guardian /var/log/e2guardian 2>/dev/null
echo "== Config effective =="
grep -E "^(filterports|proxyip|proxyport|nodaemon)" $CONF
exec e2guardian -N
