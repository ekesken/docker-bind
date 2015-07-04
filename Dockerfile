FROM sameersbn/ubuntu:14.04.20150613
MAINTAINER erhankesken@gmail.com

ENV BIND_USER=bind \
 FORWARDERS="8.8.8.8;" \
 DNSSEC_VALIDATION=auto

RUN rm -rf /etc/apt/apt.conf.d/docker-gzip-indexes \
 && apt-get update \
 && apt-get install -y bind9 \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp
ENTRYPOINT ["/sbin/entrypoint.sh"]

