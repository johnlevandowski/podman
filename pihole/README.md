Pihole
======

## Increase buffer sizes for unbound so-rcvbuf and so-sndbuf if needed

```
sysctl net.core.rmem_max net.core.wmem_max
SYSCTLCONF="/etc/sysctl.d/80-unbound.conf"
echo 'net.core.rmem_max=1048576' | sudo tee -a $SYSCTLCONF > /dev/null
echo 'net.core.wmem_max=4194304' | sudo tee -a $SYSCTLCONF > /dev/null
sudo sysctl --system
```


## Disable systemd-resolved stub listener if installed/active

```
sudo mkdir /etc/systemd/resolved.conf.d
sudo cp $HOME/Documents/GitHub/podman/pihole/99-stub-listener.conf /etc/systemd/resolved.conf.d/
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
cp -r $HOME/Documents/GitHub/podman/pihole/volume/. $HOME/pihole/
chmod +x $HOME/pihole/adlists.sh
cp $HOME/Documents/GitHub/podman/pihole/pihole.pod $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/pihole/pihole.container $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/pihole/pihole-unbound.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start pihole-pod.service
```
