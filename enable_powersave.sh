#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

AVAILABLE_GOVERNORS=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
echo "Available governors: $AVAILABLE_GOVERNORS"

DESIRED_MODE='powersave'
if [[ "$AVAILABLE_GOVERNORS" == *"$DESIRED_MODE"* ]]; then
  echo "$DESIRED_MODE exists, creating service for it..."
else
  echo -e "${RED}$DESIRED_MODE mode does not exist, exiting!${NC}"
  exit 1
fi

curl -o 