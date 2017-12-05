# Installation Instruction

To install docker, run the following commands:
```
wget https://raw.githubusercontent.com/SYAN83/Packages_Installation_for_Linux/master/ec2_init.sh
chmod +x aws_ec2_docker.sh
./aws_ec2_docker.sh
```
After installation, logout and log back in.

<hr>

`aws_ec2_docker.sh` installs the following tools (tested on AWS EC2 VM, AMI: Ubuntu 16.04):
1. Git
2. Docker
  - Docker CE
  - Docker Compose
  - Docker Machine

To mount EFS to EC2:

1. add the following rules to inbound security group:

Type |Protocol |Port Range |Source
-----|---------|-----------|------
SSH  |TCP      |22         |Anywhere
NFS  |TCP      |2049       |Group ID (e.g.: sg-11c15979)

2. run commands:
  ```
  # Install the nfs client on your EC2 instance:
  sudo apt-get -y install nfs-common
  # Create a new directory on your EC2 instance, such as "efs":
  sudo mkdir efs
  # Mount your file system using the DNS name:
  sudo mount -t nfs4 -o \
    nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 \
    mount-target-ip:/ efs
  ```
