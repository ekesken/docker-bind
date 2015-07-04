#!/bin/bash
set -e

sed -i "/^};$/i \\\tforwarders { ${FORWARDERS} };" /etc/bind/named.conf.options
sed -i "s/dnssec-validation auto/dnssec-validation ${DNSSEC_VALIDATION}/g" /etc/bind/named.conf.options

# create /var/run/named
mkdir -m 0775 -p /var/run/named
chown root:${BIND_USER} /var/run/named

if [ -z "$@" ]; then
  echo "Starting named..."
  exec /usr/sbin/named -u ${BIND_USER} -g
else
  exec "$@"
fi

