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
  read -rp "Enter the path to your movies directory (e.g. /mnt/hdd/movies): " MOVIES_PATH
  sed -i "s|^MOVIES_PATH=.*|MOVIES_PATH=$MOVIES_PATH|" .env

  echo ""
  echo ".env created. Run: docker compose up -d"
else
  echo ".env already exists, skipping creation."
  echo "Run: docker compose up -d"
fi
