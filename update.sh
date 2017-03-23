#!/bin/bash
# data = 23/03/2017
# autor= MUniz SYSADM
echo "atualizando sistemas linux.."
sleep 1
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
