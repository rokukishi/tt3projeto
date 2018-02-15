#!/bin/bash
nome(){
clear
echo "Formulário"
echo "Nome: " 
read NOME
echo $NOME > /tt3projeto/nome.txt
grep -i -q '^[a-z]' /tt3projeto/nome.txt
case $? in
	0) grep -i -q '[a-z]$' /tt3projeto/nome.txt; CONTEUDO=$?; f1;;
	1) echo "Nome inválido"; sleep 3; nome;;
esac
}
f1(){
if [ $CONTEUDO == "0" ]; then
	grep -i -q '[0-9]' /tt3projeto/nome.txt
	case $? in
		0) echo "Nome inválido"; sleep 3; nome;;
		1) echo "."; sleep 1; echo "."; sleep 1; echo "."; sleep 1; bash /tt3projeto/email.sh ;;
	esac
else
	echo "Nome inválido"
	sleep 3
	nome
fi
}
nome
