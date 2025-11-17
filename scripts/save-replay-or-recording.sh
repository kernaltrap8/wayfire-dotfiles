#!/usr/bin/env bash

exec >> info.log 2> err.log

if pgrep -x wf-recorder >/dev/null; then
  pkill wf-recorder
else
  "$HOME/.config/wayfire/scripts/save-replay.sh"
fi
