#!/bin/bash
yum update -y
yum -y install squid
systemctl stop squid
# copy config from github

systemctl start squid
systemctl enable squid
systemctl status squid

# Add this line below in the EC2 'Step 3: Configure Instance Details', specifically under the 'Advanced Details' > 'User Data' section.
# This is to specify the IPs that you want to whitelist and allow access to your FP remotely
# echo "IP_ADDRESS" > /etc/squid/whitelisted_ips.txt