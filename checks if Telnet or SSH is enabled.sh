#ChatGPT
# checks if Telnet or SSH is enabled on a specific IP address:

#!/bin/bash

IP_ADDRESS="your_ip_address"

# Check if Telnet is enabled
telnet_check=$(timeout 1 telnet "$IP_ADDRESS" 23 2>&1 | grep -i "connected" | wc -l)
if [ "$telnet_check" -eq 1 ]; then
    echo "Telnet is enabled on $IP_ADDRESS"
else
    echo "Telnet is disabled on $IP_ADDRESS"
fi

# Check if SSH is enabled
ssh_check=$(timeout 1 ssh -o BatchMode=yes "$IP_ADDRESS" echo "SSH is enabled" 2>&1 | grep -i "enabled" | wc -l)
if [ "$ssh_check" -eq 1 ]; then
    echo "SSH is enabled on $IP_ADDRESS"
else
    echo "SSH is disabled on $IP_ADDRESS"
fi