#!/bin/sh

export DISPLAY=:0
export XAUTHORITY='{{ ansible_user_dir }}/.Xauthority'
status=`cat /sys/class/drm/card0-DP-1/status`
if [ $status = 'connected' ]; then
    xrandr --output {{ external_display }} --auto --right-of {{ primary_display }}
else
    xrandr --output {{ external_display }} --off
fi
