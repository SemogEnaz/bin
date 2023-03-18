#!/bin/bash

curr_brightness=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness)

new_brightness=$(($curr_brightness - 100))

echo $new_brightness > /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness
