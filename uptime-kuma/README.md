Uptime Kuma
===========


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Copy quadlet configuration

```
cp $HOME/Documents/GitHub/podman/uptime-kuma/uptime-kuma.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start uptime-kuma.service
```


## Configuration Notes

PiHole DNS Check - use 169.254.1.2 as resolver server  

Email (SMTP) Notification Setup
- Hostname = 169.254.1.2
- Port = 25
- Security = NONE
- Ignore TLS Error = YES
- From and To Email = gmail


## Allow Postfix mail sending

```
sudo micro /etc/postfix/main.cf
```

```
mynetworks = 127.0.0.0/8, [::1]/128, 10.4.15.72/32
inet_interfaces = localhost, 10.4.15.72
```

```
sudo postfix check
sudo systemctl restart postfix
```
