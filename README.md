*Want to view custom AWS startup scripts? Go here --> [Custom AWS scripts deployed to GitHub Pages](https://cottonpajamas.github.io/aws-custom-startup-scripts/)*

---

<br>

## Custom startup scripts for AWS EC2
Compilation of useful startup scripts that can be used in AWS.

<br>

*Setting up Squid HTTP forward proxy : [Squid startup script](https://cottonpajamas.github.io/aws-custom-startup-scripts/squid/start.sh)*
<br>
  - Copy this to the 'User data' section under 'Step 3: Configure Instance Details':
```
#!/bin/bash
sudo su
echo "<<list_of_IPs>>" > /home/ec2-user/whitelisted_ips.txt
curl https://cottonpajamas.github.io/aws-custom-startup-scripts/squid/start.sh --output /home/ec2-user/start.sh
chmod +x /home/ec2-user/start.sh
. /home/ec2-user/start.sh
```
