# dnsmasq-blocklist-update
A small bash script to automatically update a dnsmasq blocklist.
# Preperation
First you need to configure dnsmasq so that it uses the blocklist. You can do that for example with the line `conf-dir=/etc/dnsmasq/blocklists` in your dnsmasq.conf file.
Then modify the values of the variables (`BLOCKLISTURL`, `TEMPFILEPATH`, `MINSIZE` and `TARGETFILEPATH`) in the bash script to fit your needs.
# Usage
Just run the script.
It will download the blocklist you have chosen and checks it's filesize (`MINSIZE`), just to be sure. Then it puts it in the target directory (`TARGETFILEPATH`) dnsmasq is using and reloads the service.
I recommend to use crontab or systemd to run this sript daily.
