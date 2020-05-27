#!/bin/bash
yum update -y
yum -y install squid
systemctl stop squid

# Create backup of the original squid.conf
mv -f /etc/squid/squid.conf /etc/squid/squid.conf.bak

# Downloading custom squid.conf
curl https://cottonpajamas.github.io/aws-custom-startup-scripts/squid/squid.conf --output /etc/squid/squid.conf

# Setting file permissions
chmod 640 /etc/squid/squid.conf

# Starting squid back up
systemctl start squid
systemctl enable squid
systemctl status squid

# Add this line below in the EC2 'Step 3: Configure Instance Details', specifically under the 'Advanced Details' > 'User Data' section.
# This is to specify the IPs that you want to whitelist and allow access to your FP remotely
# echo "IP_ADDRESS" > /etc/squid/whitelisted_ips.txt
