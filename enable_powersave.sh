#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

AVAILABLE_GOVERNORS=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
echo "Available governors: $AVAILABLE_GOVERNORS"

DESIRED_MODE='powersave'
if [[ "$AVAILABLE_GOVERNORS" == *"$DESIRED_MODE"* ]]; then
  echo -e "${GREEN}$DESIRED_MODE exists, creating service for it...${NC}"
else
  echo -e "${RED}$DESIRED_MODE mode does not exist, exiting!${NC}"
  exit 1
fi

curl -o /opt/set_${DESIRED_MODE}_mode.sh https://raw.githubusercontent.com/levogevo/proxmox-powersave-mode/main/set_${DESIRED_MODE}_mode.sh
curl -o /etc/systemd/system/$DESIRED_MODE.service https://raw.githubusercontent.com/levogevo/proxmox-powersave-mode/main/${DESIRED_MODE}.service

chmod +x /opt/set_${DESIRED_MODE}_mode.sh

systemctl start ${DESIRED_MODE}.service
systemctl enable ${DESIRED_MODE}.service
systemctl status ${DESIRED_MODE}.service