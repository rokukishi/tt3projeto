#!/bin/bash
nome(){
clear
echo "-Formulário-"
echo "Nome: " 
read NOME
echo $NOME > nome.txt
grep '^[A-Z]' nome.txt
case $? in
	0) grep '[A-Z]$' nome.txt; CONTEUDO=$?; letras;;
	1) grep '^[a-z]' nome.txt; CONTEUDO=$?; outro;;
esac
}
outro(){
if (( $CONTEUDO == 0 )); then
grep '[a-z]$' nome.txt
case $? in
	0) grep '[0-9]{1-15}' nome.txt; CONTEUDO=$?; ife;;
	1) grep '[A-Z]$' nome.txt; CONTEUDO=$?; ifes;;
esac
fi
}
letras(){
if (( $CONTEUDO == 0 )); then
grep '[0-9]{1-15}' nome.txt
case $? in
	0) echo "Nome inválido"; echo "Digitar novamente"; nome;;
	1) bash /projeto/email.sh;;
esac
else
grep '[a-z]$' nome.txt
case $? in
	0) grep '[0-9]{1-15}' nome.txt; CONTEUDO=$?;;
	1) echo "Nome inválido"; nome;;
esac
case $CONTEUDO in
	0) echo "Nome inválido"; nome;;
	1) bash /projeto/email.sh;;
esac
fi
}
ife{
if (( $CONTEUDO == 0 )); then
	echo "Nome inválido"
	nome
else
	bash /projeto/email.sh
fi
}
ifes(){
if (( $? == 0 )); then
	grep '[0-9]{1-15}' nome.txt
	case $? in
		0) echo "Nome inválido"; nome;;
		1) bash /etc/email.sh;;
	esac
else
	echo "Nome inválido"
	nome
fi
}
nome
