#!/usr/bin/env bash

if pgrep -x wf-recorder >/dev/null; then
  pkill wf-recorder
else
  "$PWD/save-replay.sh"
fi
