#!/bin/bash
# Host script for rootless Podman: adlists.sh

# Wait for gravity.db to be initialized inside the container
until podman exec systemd-pihole test -f /etc/pihole/gravity.db; do
    sleep 2
done

# Brief pause for initial database lock release
sleep 3

# Path to the container's gravity database
db="/etc/pihole/gravity.db"

# Direct links to valid blocklist text files
urls=(
  "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
  "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/ultimate.txt"
  "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/tif.txt"
  "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/fake.txt"
)

# Inject URLs safely into SQLite if they do not already exist
for url in "${urls[@]}"; do
  podman exec systemd-pihole pihole-FTL sqlite3 -ni "$db" "INSERT OR IGNORE INTO adlist (address, enabled) VALUES ('$url', 1);"
done

# Force an immediate Gravity update to pull down the newly added lists
podman exec systemd-pihole pihole -g
