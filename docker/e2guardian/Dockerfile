FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends e2guardian ca-certificates && rm -rf /var/lib/apt/lists/*
RUN sed -i 's|^filterports.*|filterports = 8080|; s|^nodaemon.*|nodaemon = on|' /etc/e2guardian/e2guardian.conf
COPY bannedsites.local /tmp/bannedsites.local
RUN cat /tmp/bannedsites.local >> /etc/e2guardian/lists/bannedsitelist
RUN grep -E "^(filterports|proxyip|proxyport|nodaemon)" /etc/e2guardian/e2guardian.conf; grep -vE '^#|^$' /etc/e2guardian/lists/bannedsitelist; true
COPY entrypoint.sh /entrypoint.sh
EXPOSE 8080
CMD ["/entrypoint.sh"]
