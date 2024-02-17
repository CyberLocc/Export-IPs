# Export-IPs
A Simple Bash Script to Export IP addresses. 

I was watching a S1ren video, where she was Exporting the Victims IP address as a Env Variable. I thought this was a wonderful idea, so that my notes can just reflect $IP instead of constantly changing the IP address for each. She did the same for URLs. 

Granted, its easy enough to export these, everytime you open a new shell. I thought it would be nice, to have a script do this, and add on the ability to pull a $MY_IP Variable. That way where I had to previously declare attack box IP, I can just use $MY_IP. Now as I swicth on CTFs ect, from doing this locally or over a VPN connection, this created another issue, and thus I made this script. 

This script will check for the Tun0 IP, if it does not detect a Tun0, it will pull Eth0 instead. It sets this Variable as $MY_IP for the Attack Box IP. It will then Prompt for the Target IP and store this under $IP. It will then take the $IP and give us a variable of $URL, which is http://$IP/. For URL usage. 



IMPORTANT!!! Due to the limitions of this script creating a child process it must be ran with "Source export.sh" as sourcing from the script is not possible, that I can find (YET! but am open to ideas to fix this). 
 
