#!/bin/bash

# Get network info
wifi_name=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
ip_addr=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127.0.0.1 | head -1)
gateway=$(ip route | grep default | awk '{print $3}' | head -1)
interface=$(ip route | grep default | awk '{print $5}' | head -1)

if [ -n "$wifi_name" ]; then
    signal=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d':' -f2)
    notify-send "Network Info" "📶 WiFi: $wifi_name\n💪 Signal: ${signal}%\n🌐 IP: $ip_addr\n🚪 Gateway: $gateway\n🔌 Interface: $interface" -t 5000
else
    notify-send "Network Info" "🌐 IP: $ip_addr\n🚪 Gateway: $gateway\n🔌 Interface: $interface" -t 5000
fi
