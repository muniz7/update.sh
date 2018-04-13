#!/bin/bash
# data= 03/09/2017
# criador= Muniz_TI
while true
do
OPCAO=$(dialog --title "menu de opcoes"	\
               --menu "" \
	        0 50 0 1 'Atualiza sistemas' \
	              2 'Instala programas' \
	              3 'Encontrar pacote cache' \
	              4 'Alterar senha de usuario' \
    		      5 'Acrescentar usuario' \
	              6 'Listar arquivos' \
	              7 'Versão kernel' \
	    	      8 'Lista PEN_DRIVER' \
		          9 'Deseja limpar SSD' \
		         10 'Limpeza de sistema Linux' \
		         11	'Desligar ou Reiniciar Notebook' \
		         12 'Sair do menu' --stdout)
case $OPCAO in
	1)
		sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
;;
	2)
	 	read -p "digite prog: " prog
		sudo apt install $prog
;;
	3)
		read -p "digite o pacote: " pacote
		sudo apt-cache search $pacote |less
		sleep 10
;;
	4)
		read -p -n "digite senha do user a ser alterado" user
		sudo passwd $user
;;
	5)
		read -p -n "digite nome" nome
		sudo useradd $nome
;;
	6)
		dialog --textbox "`ls /home/$USER/`" 50 50
		sleep 10
;;
	7)
		echo "linux kernel $(uname -r)"
		sleep 7 
;;
	8)
if [[ -e /dev/sdc ]] #&& echo "pen driver detectado"; sleep 0.8 || echo "nenhum dispositivo detectado";sleep 0.5
then		
	echo "pen driver detectado"
else
			echo "nenhum dispositivo detectado"
			sleep 1
fi
;;	
	9) 
	whiptail --yesno "Limpeza SSD" --fb 10 40
	if [ $? = 0 ]
then
	echo -n "Limpando SSD" ; echo -n ".";sleep 1; echo -n "."; sleep 1; echo -n "."; 
	sudo fstrim -v /
	sleep 4
else
	echo "LImpeza Cancelada"
	sleep 2
fi
;;
	10)
	whiptail --yesno "Deseja limpar sistema" --fb 10 40
	if [ $? = 0 ]
    then
	dialog --infobox "limpando arquivos baixados" 4 30
	sleep 0.8
    sudo rm -rf /var/cache/apt/archives/*.deb
	sleep 4
   	dialog --infobox "limpeza de cache" 4 25
    sleep 0.8 
	sudo apt-get clean -y > /dev/null && sudo apt autoremove > /dev/null
	sleep 1
	dialog --infobox "limpando pasta TMP" 4 30
	sudo rm -rf /var/tmp/*.*
	sleep 0.8
	dialog --infobox "limpado Lixeira" 4 30
	rm -rf /home/$USER/.local/share/Trash/files/*.*
	sleep 1
	dialog --infobox "reconfigurando dpkg" 4 40
	sleep 0.8
	sudo dpkg --configure -a
else
	dialog --infobox "Limpeza cancelada" 4 25
	sleep 2
fi
;;
	11)
	whiptail --yesno "Desligar ou reiniciar(s|S | n|N)" --fb 10 40

	if [ $? = 0 ];
	then
		echo "desligando..."
		0.7
		sudo shutdown -h now
	else
		echo "desligamento cancelado"
		sleep 0.8
	fi
;;

	12)
exit
esac
done

