Podman
======

## Packages (apt uses the same package names)

```
sudo dnf install \
podman \
podman-compose \
systemd-container
```


## Rootless privileged port permissions

```
echo 'net.ipv4.ip_unprivileged_port_start=53' | sudo tee -a /etc/sysctl.d/99-ip-unpriv-port.conf > /dev/null
sudo sysctl --system
```


## Add rootless podman user and start containers on boot

```
sudo useradd -m -s /bin/bash john-podman
grep john-podman /etc/subuid
grep john-podman /etc/subgid
sudo loginctl enable-linger john-podman
```


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Configure and test

```
git clone https://github.com/johnlevandowski/podman $HOME/Documents/GitHub/podman
mkdir -p $HOME/.config/containers/systemd/
podman run --name hello hello
podman container rm hello
podman image rm hello
```


## Generate podman quadlet from docker compose file

```
podman run --rm -v ./compose.yaml:/compose.yaml:Z ghcr.io/containers/podlet compose /compose.yaml
```
