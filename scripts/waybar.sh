#!/bin/bash

kill $(pgrep -x waybar)
exec "$HOME/.config/wayfire/scripts/start-waybar.sh"
