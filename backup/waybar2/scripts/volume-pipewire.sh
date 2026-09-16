#!/bin/bash

# A simple script to get PipeWire volume and mute status for Waybar.
# This script outputs a JSON object, which is the recommended Waybar format.

# Get the volume and mute status using wpctl.
STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOLUME=$(echo "$STATUS" | awk '{print $2}' | sed 's/\.//') # Extract volume percentage
MUTE=$(echo "$STATUS" | awk '{if ($3 == "[MUTED]") print "true"; else print "false"}')

# Use icons based on volume level
if [ "$MUTE" == "true" ]; then
    ICON="" # Muted icon
    CLASS="muted"
    PERCENTAGE=0
else
    # Choose icon based on volume level
    if [ "$VOLUME" -gt 66 ]; then
        ICON="" # High volume icon
    elif [ "$VOLUME" -gt 33 ]; then
        ICON="" # Medium volume icon
    else
        ICON="" # Low volume icon
    fi
    CLASS=""
    PERCENTAGE=$VOLUME
fi

# Output a JSON object.
# The 'text' field is what is displayed.
# The 'class' field can be used for CSS styling.
# 'percentage' is for built-in Waybar features (like tooltips).
echo '{"text": "'"$ICON"' '$VOLUME'%", "class": "'"$CLASS"'", "percentage": '$PERCENTAGE'}'

