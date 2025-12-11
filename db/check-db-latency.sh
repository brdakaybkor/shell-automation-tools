#!/usr/bin/env bash
HOST="$1"
USER="$2"
DB="$3"

if [[ -z "$HOST" || -z "$USER" || -z "$DB" ]]; then
  echo "Usage: $0 host user database"
  exit 1
fi

START=$(date +%s%3N)
mysql -h "$HOST" -u "$USER" "$DB" -e "SELECT 1" &>/dev/null
END=$(date +%s%3N)

LATENCY=$((END - START))
echo "DB latency: ${LATENCY} ms"
