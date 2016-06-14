#!/bin/sh
if [ "$1" = "--help" ]; then
    echo "Usage: $0 host domain token [interface]"
    echo "Updates Namecheap DNS with an IP address for a given domain."
    echo "Omitting the interface causes Namecheap to determine the public IP of your location."
    exit
fi

HOST=$1
DOMAIN=$2
TOKEN=$3
INTERFACE=$4

if [ -z "$HOST" ] || [ -z "$DOMAIN" ] || [ -z "$TOKEN" ]; then
    echo "Host, domain and token are required. Aborting."
    exit 1;
fi

if ! [ -z "$INTERFACE" ]; then
    IP_ADDRESS=$(/sbin/ifconfig "$INTERFACE" | awk '/inet addr/{print substr($2, index($2, ":") + 1)}')
fi

curl "https://dynamicdns.park-your-domain.com/update?host=$HOST&domain=$DOMAIN&password=$TOKEN&ip=$IP_ADDRESS"
