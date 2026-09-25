#!/bin/bash

podman exec -it systemd-pihole pihole allow api.us-east-1.aiv-delivery.net --comment "amazon prime video"
podman exec -it systemd-pihole pihole allow log.tailscale.com --comment "tailscale.com"

podman exec -it systemd-pihole pihole allow-regex "^images1\.cmp\.optimizely\.com$|^images2\.cmp\.optimizely\.com$|^images3\.cmp\.optimizely\.com$|^images4\.cmp\.optimizely\.com$" --comment "roadscholar.org"

# monitoring.us-east-1.amazonaws.com

# (\.|^)delta\.com$
# delta.demdex.net
# dpm.demdex.net

# click.discord.com

# links.h5.hilton.com

# mps.nbcuni.com
# id.nbcuni.com

# common-logger.cdn.web.vanguard.com
# smetrics.vanguard.com
