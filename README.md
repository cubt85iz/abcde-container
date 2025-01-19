# abcde-container

| :warning: **WORK IN PROGRESS** |
|--|
| Trying this out. If it works, I'll include examples for tying into udev & systemd to automate. |

_~/.config/containers/systemd/abcde@.container_

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
Restart=on-failure
```

Interesting links
===
https://blog.fraggod.net/2015/01/12/starting-systemd-service-instance-for-device-from-udev.html
https://jctechnotes.blogspot.com/2012/10/auto-rip-cds-on-headless-server-using.html