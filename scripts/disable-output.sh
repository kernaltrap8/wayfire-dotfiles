#!/bin/bash

# Set your output name here
OUTPUT="$1"

# Capture output block for the specified output
STATUS=$(wlr-randr | awk -v out="$OUTPUT" '
  $1 == out { in_block=1; next }
  in_block && $1 == "Enabled:" { print $2; exit }
')

echo "$STATUS"

# Check if we got a valid status
if [ -z "$STATUS" ]; then
    notify-send "Output $OUTPUT not found or not connected."
    exit 1
fi

if [ "$STATUS" = "no" ]; then
    # Turn the output on with preferred mode and position
    wlr-randr --output "$OUTPUT" --on --pos 0,0
    notify-send "Output $OUTPUT turned ON."
else
    # Turn the output off
    wlr-randr --output "$OUTPUT" --off
    notify-send "Output $OUTPUT turned OFF."
fi
