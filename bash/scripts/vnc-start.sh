#!/bin/bash
pgrep Xvfb >/dev/null || nohup Xvfb :1 -screen 0 2540x1490x24 >/tmp/xvfb.log 2>&1 &
sleep 1
pgrep -x i3 >/dev/null || DISPLAY=:1 nohup dbus-run-session -- i3 >/tmp/i3.log 2>&1 &
sleep 2
pgrep x11vnc >/dev/null || x11vnc -display :1 -forever -rfbauth ~/.vnc/passwd -localhost -noxdamage -bg -o /tmp/x11vnc.log
