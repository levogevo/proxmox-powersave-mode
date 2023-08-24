#!/bin/bash

AVAILABLE_GOVERNORS=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors)
echo "Available governors: $AVAILABLE_GOVERNORS"