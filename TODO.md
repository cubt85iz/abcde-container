# TODO

## SELinux Denials

There are a few SELinux denials that need to be reviewed. I'll need to determine the correct solution and then document (if there's nothing to fix in this repo).

```
Jan 20 10:48:23 cyclops audit[2042532]: AVC avc:  denied  { getattr } for  pid=2042532 comm="abcde" path="/dev/cdrom" dev="devtmpfs" ino=4498 scontext=system_u:system_r:container_t:s0:c75,c732 tcontext=system_u:object_r:removable_device_t:s0 tclass=blk_file permissive=1
Jan 20 10:48:23 cyclops abcde@-dev-sr0[2042491]: 33d3dbebd06851fc15c2372aa48ba17ceafb127b9785861130178fab4b190ede
Jan 20 10:48:24 cyclops audit[2042610]: AVC avc:  denied  { read write } for  pid=2042610 comm="cdparanoia" name="sr0" dev="devtmpfs" ino=4498 scontext=system_u:system_r:container_t:s0:c75,c732 tcontext=system_u:object_r:removable_device_t:s0 tclass=blk_file permissive=1
Jan 20 10:48:24 cyclops audit[2042610]: AVC avc:  denied  { open } for  pid=2042610 comm="cdparanoia" path="/dev/cdrom" dev="devtmpfs" ino=4498 scontext=system_u:system_r:container_t:s0:c75,c732 tcontext=system_u:object_r:removable_device_t:s0 tclass=blk_file permissive=1
Jan 20 10:48:24 cyclops audit[2042610]: AVC avc:  denied  { ioctl } for  pid=2042610 comm="cdparanoia" path="/dev/cdrom" dev="devtmpfs" ino=4498 ioctlcmd=0x2285 scontext=system_u:system_r:container_t:s0:c75,c732 tcontext=system_u:object_r:removable_device_t:s0 tclass=blk_file permissive=1
```

- _Workaround_: Place SELinux into permissive mode when ripping CDs.
- _Priority_: Low
