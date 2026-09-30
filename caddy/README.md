Caddy Server
============

## Increase buffer sizes for caddy if needed

```
sysctl net.core.rmem_max net.core.wmem_max
SYSCTLCONF="/etc/sysctl.d/80-buffers.conf"
echo 'net.core.rmem_max=7340032' | sudo tee -a $SYSCTLCONF > /dev/null
echo 'net.core.wmem_max=7340032' | sudo tee -a $SYSCTLCONF > /dev/null
sudo sysctl --system
```


## Firewall

```
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Cloudflare API secret

```
printf "CLOUDFLARE_API_TOKEN" | podman secret create CLOUDFLARE_API_TOKEN -
```


## Copy quadlet configuration

Update LANDOMAIN and TSDOMAIN environment variables in caddy.container  

```
mkdir -p $HOME/caddy/
cp -r $HOME/Documents/GitHub/podman/caddy/volume/. $HOME/caddy/
cp $HOME/Documents/GitHub/podman/caddy/caddy.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start caddy.service
```
