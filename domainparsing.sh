#!/bin/bash

if [ "$1" == "" ]
	then
		echo "ANALISE DE DOMÍNIO"
		echo "Eemplo de uso: $0 ./domainparsing.sh www.google.com"
	else
		wget $1 2> /dev/null --output-document="$1.html"
		echo -e "\033[1;31m==============================================================================\033[m"
		echo -e "\033[1;32m [+] Resolvendo URLs:\033[m $1"
		echo -e "\033[1;31m==============================================================================\033[m"
		echo -e "\033[1;33m [+] Salvando a pagina HTML no arquivo:\033[m $1.html"
		echo -e "\033[1;31m==============================================================================\033[m"
		cat "$1.html" | grep "href" | cut -d "/" -f 3 | grep "\." | grep -v "<l" | cut -d '"' -f 1 > listadominios
		for url in $(cat listadominios);
		do
			host $url | grep "has address";
		done
		echo -e "\033[1;31m==============================================================================\033[m"
		echo -e "\nLinha \t\t\t\t IP \t\t\t\t Endereco\n"
		echo -e "\033[1;31m==============================================================================\033[m"

fi
