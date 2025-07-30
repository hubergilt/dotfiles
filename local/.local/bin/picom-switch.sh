#!/bin/bash
# Save as ~/.local/bin/picom-switch.sh

if [ "$1" = "battery" ]; then
    pkill picom
    picom --config ~/.config/picom/picom-battery.conf &
    echo "Switched to battery mode"
elif [ "$1" = "visual" ]; then
    pkill picom
    picom --config ~/.config/picom/picom-visual.conf &
    echo "Switched to visual mode"
else
    echo "Usage: picom-switch.sh [battery|visual]"
fi
