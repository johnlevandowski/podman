Cockpit
=======

## Packages

```
sudo dnf install \
cockpit \
cockpit-files \
cockpit-networkmanager \
cockpit-packagekit \
cockpit-podman \
cockpit-selinux \
cockpit-storaged
```

```
sudo systemctl enable --now cockpit.socket
sudo systemctl status cockpit.socket
```


## Caddy proxy to cockpit

```
sudo micro /etc/cockpit/cockpit.conf
```

```
[WebService]
AllowUnencrypted = true
Origins = https://cockpit.geekoma5.lan.johnl.dev wss://cockpit.geekoma5.lan.johnl.dev https://cockpit.geekoma5.ts.johnl.dev wss://cockpit.geekoma5.ts.johnl.dev
ProtocolHeader = X-Forwarded-Proto
```

```
sudo systemctl restart cockpit.service
```
