#!/bin/bash
set -e

PUID=$(id -u)
PGID=$(id -g)

echo "Detected PUID=$PUID, PGID=$PGID"

if [ ! -f .env ]; then
  cp .env.example .env
  sed -i "s/^PUID=.*/PUID=$PUID/" .env
  sed -i "s/^PGID=.*/PGID=$PGID/" .env
  echo ""
  echo "Created .env — set your MOVIES_PATH in it, then run:"
  echo "  docker compose up -d"
else
  echo ".env already exists, skipping creation."
  echo "Run: docker compose up -d"
fi
