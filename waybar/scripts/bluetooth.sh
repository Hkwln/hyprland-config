#!/bin/bash

# Check if bluetooth is powered on
if bluetoothctl show | grep -q "Powered: yes"; then
    # Check if any device is connected
    if bluetoothctl devices Connected | grep -q "Device"; then
        echo '{"text":"Connected","class":"on","tooltip":"Bluetooth: Connected","alt":"on"}'
    else
        echo '{"text":"On","class":"on","tooltip":"Bluetooth: On (no devices)","alt":"on"}'
    fi
else
    echo '{"text":"Off","class":"off","tooltip":"Bluetooth: Off","alt":"off"}'
fi
