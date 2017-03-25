#!/bin/bash
#data=08/02/2017
#author= Muniz SYSADMIN
#Função=Atualizar sistemas LINUX
#E-mail = <mcarlos370@gmail.com>
#Version= 1.0 <08-02-2017>
echo "atualizando sistema..."
sleep 1
echo -n .
sleep 1
echo -n .
sleep 1
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade