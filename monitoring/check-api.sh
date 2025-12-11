#!/usr/bin/env bash
URL="$1"

if [[ -z "$URL" ]]; then
  echo "Usage: $0 https://api.example.com/health"
  exit 1
fi

STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [[ "$STATUS" -eq 200 ]]; then
  echo "[OK] $URL is healthy (HTTP $STATUS)"
else
  echo "[WARN] $URL returned HTTP $STATUS"
fi
