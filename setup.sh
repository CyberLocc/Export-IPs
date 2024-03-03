#!/bin/bash

# Function to get IP address of a specific interface
get_ip() {
    local interface="$1"
    ip addr show dev "$interface" | awk '/inet / {print $2}' | cut -d'/' -f1
}

# Function to create project folders
create_project_folders() {
    local projectName="$1"
    mkdir -p ~/Projects/"$projectName"/{enum,loot,privesc,exploit}
}

echo "===================================================================================="
echo "                                  +++ Setup.SH +++"
echo "===================================================================================="

# Check if script is running as root
if [[ $EUID -eq 0 ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

# Detecting MY_IP
if ip link show dev tun0 &> /dev/null; then
    LH=$(get_ip tun0)
    INTERFACE="tun0"
elif ip link show dev eth0 &> /dev/null; then
    LH=$(get_ip eth0)
    INTERFACE="eth0"
else
    echo "No suitable interface found."
    exit 1
fi

# Prompt for user-defined Variables
read -r -p "Enter Project Name: " PNAME
read -p "Enter target IP address: " IP
read -p "Enter Desired LPORT: " LPORT

# Set the environment variables
export PNAME="$PNAME"
export IP="$IP"
export LH="$LH"
export URL="http://$IP"
export LPORT="$LPORT"

# Interactive Setup
echo "Interactive Setup:"
echo "=================="
echo "Project Name: $PNAME"
echo "Target IP address: $IP"
echo "Desired LPORT: $LPORT"
echo

# Verifying Interfaces
echo "Checking network interface..."
if [[ -z $INTERFACE ]]; then
    echo "Error: No suitable network interface found."
    exit 1
else
    echo "Network interface detected: $INTERFACE"
fi
echo

# Ask if user wants to add entry to /etc/hosts
read -p "Do you want to add an entry to /etc/hosts for $IP? [Y/N]: " addHosts

if [[ $addHosts =~ ^[Yy]$ ]]; then
    # Ask if user wants to specify the domain extension
    read -p "Do you want to specify a domain extension for the hosts file? (Default: com) [Y/N]: " specifyExtension

    if [[ $specifyExtension =~ ^[Yy]$ ]]; then
        read -p "Enter the desired domain extension (e.g., com, org, net): " domainExtension
    else
        domainExtension="com"
    fi

    # Add entry to /etc/hosts
    echo "$IP.$domainExtension $PNAME" | $SUDO tee -a /etc/hosts >/dev/null
    echo "Entry added to /etc/hosts."
    if [[ $SUDO == "sudo" ]]; then
        echo "Please enter your sudo password to adjust hosts."
    fi
fi


# Create project folders
create_project_folders "$PNAME"

# Print Results 
echo 
echo "===================================================================================="
echo "                           +++ Project Setup Complete +++"
echo "===================================================================================="
echo
echo "Environment variables set and saved to ~/.zshrc:"
echo "Project Name: $PNAME" 
echo "Project Folders Created at ~/$PNAME/"
echo "Target IP: $IP"
echo "Target URL: $URL"
echo "LH: $LH ($INTERFACE)"
echo "Port: $LPORT"
echo
echo "===================================================================================="
echo "                     +++ Please Launch New Shell for Changes +++"
echo "===================================================================================="
