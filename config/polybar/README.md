# Backlight scrolling
1. Add user to group video: ``usermod -aG video username``
2. Create/add: ``/etc/udev/rules.d/backlight.rules``:
```
#ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0664"
RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
RUN+="/bin/chown 1000 /sys/class/backlight/intel_backlight/brightness"
```
3. Add to ``/etc/default/grub``
```
GRUB_CMDLINE_LINUX_DEFAULT="acpi_backlight=video"
```
