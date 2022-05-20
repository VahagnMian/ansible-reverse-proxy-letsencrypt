#!/bin/bash

RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m'


echo -e "${YELLOW}[WARNING]${NC} For privacy purposes do ssh-add of your private key or configure your ~/.ssh/config file"
echo


read -r -p "$( echo -e ${YELLOW}[...]${NC} "Please enter server address: " )" server_ip

read -r -p "$( echo -e ${YELLOW}[...]${NC} 'Please enter "server_name" for nginx reverse proxy: ' )" server_name
read -r -p "$( echo -e ${YELLOW}[...]${NC} 'Please enter "server_name" for nginx reverse proxy nexus: ' )" server_name_nexus


ansible-playbook playbook.yaml --extra-vars="target_host=$server_ip" --extra-vars="server_name=$server_name"  --extra-vars="server_name_1=$server_name_nexus"