Unbound
=======

## Increase buffer sizes for unbound so-rcvbuf and so-sndbuf

```
sudo cp $HOME/Documents/GitHub/podman/80-unbound.conf /etc/sysctl.d/
sudo sysctl --system
```


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Copy quadlet configuration

```
cp $HOME/Documents/GitHub/podman/unbound/unbound.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start unbound.service
```
