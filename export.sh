#!/bin/bash
### Must be Run as "source export.sh" due to issues with sub procresses not allowing the script to source itself. ###

# Function to get IP address of a specific interface
get_ip() {
    local interface="$1"
    ip addr show dev "$interface" | awk '/inet / {print $2}' | cut -d'/' -f1
}

# Detecting MY_IP
if ip link show dev tun0 &> /dev/null; then
    MY_IP=$(get_ip tun0)
    INTERFACE="tun0"
elif ip link show dev eth0 &> /dev/null; then
    MY_IP=$(get_ip eth0)
    INTERFACE="eth0"
else
    echo "No suitable interface found."
    return 1
fi

# Prompt for user-defined target IP address
echo -n "Enter target IP address: "
read IP

# Set the environment variables
export MY_IP="$MY_IP"
export IP="$IP"
export URL="http://$IP/"

# Print instructions
echo "Environment variables set:"
echo "Attack IP: $MY_IP ($INTERFACE)"
echo "Target IP: $IP"
echo "Target URL: $URL"
