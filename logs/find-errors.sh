#!/usr/bin/env bash
LOG_FILE="$1"

if [[ ! -f "$LOG_FILE" ]]; then
  echo "Usage: $0 /path/to/logfile.log"
  exit 1
fi

grep -iE "ERROR|Exception|Timeout" "$LOG_FILE" | tail -n 50
