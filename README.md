# Installation Instruction

To install, run the following commands:
```
wget https://raw.githubusercontent.com/SYAN83/Packages_Installation_for_Linux/master/ec2_init.sh
chmod +x ec2_init.sh
./ec2_init.sh
```
After installation, logout and log back in.

<hr>

`ec2_init.sh` installs the following tools (tested on AWS EC2 VM, AMI: Ubuntu 16.04):
1. Git
2. Docker
  - Docker CE
  - Docker Compose
  - Docker Machine
3. Python3 virtualenv
