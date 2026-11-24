FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y --no-install-recommends squid squidguard ca-certificates python3 && \
rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/squidguard /var/lib/squidguard/db/blocked /var/log/squidguard
COPY squid.conf /etc/squid/squid.conf
COPY squidGuard.conf /etc/squidguard/squidGuard.conf
COPY blocked/domains /var/lib/squidguard/db/blocked/domains
RUN squidGuard -C all -c /etc/squidguard/squidGuard.conf || true && \
chown -R proxy:proxy /var/lib/squidguard /var/log/squidguard /var/spool/squid /var/log/squid
COPY blocked.html /blocked.html
COPY entrypoint.sh /entrypoint.sh
EXPOSE 3128 8081
CMD ["/entrypoint.sh"]
