Pihole
======

## Increase buffer sizes for unbound so-rcvbuf and so-sndbuf

```
sudo cp $HOME/Documents/GitHub/podman/80-unbound.conf /etc/sysctl.d/
sudo sysctl --system
```


## Disable systemd-resolved stub listener if installed/active

```
sudo mkdir /etc/systemd/resolved.conf.d
sudo cp $HOME/Documents/GitHub/podman/99-stub-listener.conf /etc/systemd/resolved.conf.d/
sudo systemctl restart systemd-resolved.service
```


## Firewall

```
sudo firewall-cmd --permanent --add-service=dns
sudo firewall-cmd --reload
```


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Pihole webserver api passwored

```
printf "PIHOLE_WEBSERVER_API_PASSWORD" | podman secret create PIHOLE_WEBSERVER_API_PASSWORD -
```


## Copy quadlet configuration

Update FTLCONF_webserver_domain environment variable in pihole.container  

```
mkdir -p $HOME/pihole/
cp -r $HOME/Documents/GitHub/podman/pihole/. $HOME/pihole/
cp $HOME/Documents/GitHub/podman/pihole/pihole.pod $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/pihole/pihole.container $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/pihole/unbound.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
# systemctl --user start pihole.service
systemctl --user start pihole-pod.service
```
