# Export-IPs

A Simple Bash Script to Export IP addresses.

I was watching a S1ren video where she was exporting the victim's IP address as an environment variable. I thought this was a wonderful idea so that my notes could just reflect $IP instead of constantly changing the IP address for each. She did the same for URLs.

Granted, it's easy enough to export these every time you open a new shell. I thought it would be nice to have a script do this and add on the ability to pull a $MY_IP variable. That way, where I had to previously declare the attack box IP, I can just use $MY_IP. Now, as I switch between CTFs, whether doing them locally or over a VPN connection, this created another issue, and thus, I made this script.

This script will check for the tun0 IP. If it does not detect tun0, it will pull eth0 instead. It sets this variable as $MY_IP for the attack box IP. It will then prompt for the target IP and store this under $IP. It will then take the $IP and give us a variable of $URL, which is http://$IP/ for URL usage.

IMPORTANT!!! Due to the limitations of this script creating a child process, it must be run with "source export.sh" as sourcing from the script is not possible, as far as I know (YET! But I am open to ideas to fix this).
 
