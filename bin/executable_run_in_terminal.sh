#!/bin/bash
#
# Prompt for command with history using Zenity, and run it in Alacritty.

set -o errexit
set -o nounset
set -o pipefail

readonly HISTORY_FILE="${HOME}/.config/run_history.txt"
touch "${HISTORY_FILE}"

# Read existing history
mapfile -t history_list < <(cat "${HISTORY_FILE}")

# Prepare options for Zenity list
options=("[New Command...]")
for cmd in "${history_list[@]}"; do
  if [[ -n "${cmd}" ]]; then
    options+=("${cmd}")
  fi
done

# Show list dialog
selected_cmd=$(zenity --list \
  --title="Run in Terminal" \
  --column="Recent Commands" \
  "${options[@]}" \
  --width=400 --height=300)

if [[ -z "${selected_cmd}" ]]; then
  exit 0 # User canceled
fi

if [[ "${selected_cmd}" == "[New Command...]" ]]; then
  # Prompt for new command
  selected_cmd=$(zenity --entry --title="Run in Terminal" --text="Command:")
  if [[ -z "${selected_cmd}" ]]; then
    exit 0 # User canceled
  fi
fi

# Run the command in Alacritty and sleep for 2s after
# We run it in background so the script can finish and save history
alacritty -T "Run: ${selected_cmd}" -e bash -ci "${selected_cmd}; sleep 2" &

# Update history file: Prepend new command, remove duplicates, limit to 15
new_history=("${selected_cmd}")
for cmd in "${history_list[@]}"; do
  if [[ "${cmd}" != "${selected_cmd}" && -n "${cmd}" ]]; then
    new_history+=("${cmd}")
  fi
done

# Write top 15 back to file
printf "%s\n" "${new_history[@]:0:15}" > "${HISTORY_FILE}"
