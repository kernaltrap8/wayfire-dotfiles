#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

SIGBAR="$SCRIPT_DIR/sigbar"
current_date=$(date +"%Y-%m-%d-%H-%M-%S")
LOG="sigbar-$current_date.log"

$SIGBAR &>$LOG
