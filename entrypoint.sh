#!/bin/sh
HASHEDPASSWORD=`tor --hash-password ${PASSWORD}` &>/dev/null
printf "SOCKSPort 0.0.0.0:9050\nControlPort 0.0.0.0:9051\nHashedControlPassword ${HASHEDPASSWORD}\n" > /var/lib/tor/torrc
mkdir -p -m 700 /var/lib/tor/hidden_service
chown -R tor:nogroup /var/lib/tor/hidden_service
/usr/bin/tor -f /var/lib/tor/torrc --runasdaemon 0
