#!/bin/bash

# Get bluetooth status
if bluetoothctl show | grep -q "Powered: yes"; then
    devices=$(bluetoothctl devices Connected 2>/dev/null)
    
    if [ -n "$devices" ]; then
        device_info=""
        while IFS= read -r line; do
            mac=$(echo "$line" | awk '{print $2}')
            name=$(echo "$line" | cut -d' ' -f3-)
            device_info+="🔗 $name\n"
        done <<< "$devices"
        notify-send "Bluetooth" "Status: ON\n\nConnected Devices:\n$device_info" -t 5000
    else
        notify-send "Bluetooth" "Status: ON\n\n⚠️ No devices connected" -t 5000
    fi
else
    notify-send "Bluetooth" "Status: OFF" -t 5000
fi
