#!/bin/bash

kill $(pgrep -x waybar)
exec "$HOME/scripts/start-waybar.sh"
