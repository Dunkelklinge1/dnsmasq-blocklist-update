#!/bin/bash

BLOCKLISTURL="https://raw.githubusercontent.com/hagezi/dns-blocklists/main/dnsmasq/tif.normal.txt"
TEMPFILEPATH="/tmp/new-blocklist.txt"
MINSIZE=1048576 # 1MiB
TARGETFILEPATH="/etc/dnsmasq/blocklists/blocklist.txt"

# Download newest blocklist
curl "$BLOCKLISTURL" --output "$TEMPFILEPATH" --silent
# Check if temp file is large enough
if [ $(stat -c %s "$TEMPFILEPATH") -gt $MINSIZE ]; then
    # Move file to right place
    mv $TEMPFILEPATH $TARGETFILEPATH
    # Reload dnsmasq daemon
    systemctl reload dnsmasq.service
fi
