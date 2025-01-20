# abcde-container

Container that will rip a CD to the specified host directory.

_~/.config/containers/systemd/abcde@.container_

A sample quadlet file for a container service that will rip the CD in the specified device. This can be invoked manually by specifying `systemctl start abcde@/dev/sr0` or your target optical device.

```
[Unit]
Description=Container for processing audio CDs using abcde

[Container]
ContainerName=%p
Image=ghcr.io/cubt85iz/abcde-container:latest
Volume=%h/.abcde.conf:/etc/abcde.conf
Volume=%h/Music:/output
AddDevice=%I:/dev/cdrom
AutoUpdate=registry

[Service]
ExecStopPost=eject %I
```

After adding this service, you will need to execute `systemctl --user daemon-reload`.

_/etc/udev/rules.d/99-abcde.conf_

Add a line for each optical drive you wish to use for ripping CDs. It will invoke the container service above for each disc inserted and automatically eject when the container stops.

```
SUBSYSTEM=="block", KERNEL=="sr0", ENV{ID_CDROM_MEDIA_CD}=="1", PROGRAM="/usr/bin/systemd-escape --template=abcde@.service $env{DEVNAME}", ENV{SYSTEMD_USER_WANTS}+="%c"
```

After adding the rule you will need to reload the rules for them to take effect.

```
udevadm control --reload-rules
```

## SELinux

Your abcde.conf file that is mounted by the container must be labeled `container_file_t`.

```sh
sudo chcon -t container_file_t ~/.abcde.conf
```

Containers must be able to use devices to access the CDROM.

```sh
sudo setsebool -P container_use_devices 1
```

## References

- https://blog.fraggod.net/2015/01/12/starting-systemd-service-instance-for-device-from-udev.html
- https://jctechnotes.blogspot.com/2012/10/auto-rip-cds-on-headless-server-using.html
