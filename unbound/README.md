Unbound
=======

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
