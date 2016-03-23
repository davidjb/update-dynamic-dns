#!/bin/sh
if [ "$1" = "--help" ]; then
    echo "Usage: $0 domain token [interface]"
    echo "Updates Duck DNS with an IP address for a given domain."
    echo "Omitting the interface causes Duck DNS to determine the public IP of your location."
    exit
fi

DOMAIN=$1
TOKEN=$2
INTERFACE=$3

if [ -z "$DOMAIN" ] || [ -z "$TOKEN" ]; then
    echo "Both domain and token are required. Aborting."
    exit 1;
fi

if ! [ -z "$INTERFACE" ]; then
    IP_ADDRESS=$(/sbin/ifconfig "$INTERFACE" | awk '/inet addr/{print substr($2, index($2, ":") + 1)}')
fi

curl "https://www.duckdns.org/update?domains=$DOMAIN&token=$TOKEN&ip=$IP_ADDRESS"
