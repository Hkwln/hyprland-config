#!/bin/bash

# Check if bluetooth is powered on
if bluetoothctl show | grep -q "Powered: yes"; then
    # If powered on, check if any devices are connected
    if bluetoothctl info | grep -q "Connected: yes"; then
        # If connected, show the connected icon and device name
        device_name=$(bluetoothctl info | grep "Name:" | cut -d ' ' -f 2-)
        echo " $device_name"
    else
        # If not connected, show the disconnected icon
        echo ""
    fi
else
    # If powered off, show the disabled icon
    echo ""
fi
