Immich
======


## Create backups folder in samba share for immich.container

```
sudo mkdir -p /share/lan/immich
sudo chown -R 1001:1001 /share/lan
```


## Run as rootless podman user

```
sudo machinectl shell john-podman@
```


## Database password

```
printf "DB_PASSWORD" | podman secret create DB_PASSWORD -
```


## Copy quadlet configuration

**SecurityLabelDisable=true in immich.container because /share volumes are shared via samba and cause conflicts with SELinux**

Update volumes in immich.container  

```
cp $HOME/Documents/GitHub/podman/immich/immich.pod $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/immich/immich.container $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/immich/immich-database.container $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/immich/immich-machine-learning.container $HOME/.config/containers/systemd/
cp $HOME/Documents/GitHub/podman/immich/immich-redis.container $HOME/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user start immich-pod.service
```


## Post setup

Immich > Administration > Settings > Machine Learning Settings > URL = http://localhost:3003
