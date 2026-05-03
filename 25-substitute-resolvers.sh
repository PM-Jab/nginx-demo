#!/bin/sh
set -e

CONF=/etc/nginx/conf.d/default.conf

RESOLVERS=$(awk 'BEGIN{ORS=" "} $1=="nameserver" {if ($2 ~ ":") {print "["$2"]"} else {print $2}}' /etc/resolv.conf)

if [ -z "$RESOLVERS" ]; then
    echo "25-substitute-resolvers.sh: no nameservers found in /etc/resolv.conf, falling back to 127.0.0.11" >&2
    RESOLVERS="127.0.0.11"
fi

echo "25-substitute-resolvers.sh: using resolvers: $RESOLVERS"
sed -i "s|__RESOLVERS__|${RESOLVERS}|g" "$CONF"
