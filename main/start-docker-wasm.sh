#!/bin/bash
TARGET_DIR="docker"
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory '$TARGET_DIR' not found."
  exit 1
fi
cd "$TARGET_DIR" || exit
if [ ! -f "docker-compose.yml" ]; then
  echo "'docker-compose.yml' not found in '$TARGET_DIR'."
  exit 1
fi
echo "Running port."
docker compose up -d
if [ $? -eq 0 ]; then
  echo "TCL: OK~443"
  echo "D-BUS: OK~80"
else
  echo "Retry."
fi
