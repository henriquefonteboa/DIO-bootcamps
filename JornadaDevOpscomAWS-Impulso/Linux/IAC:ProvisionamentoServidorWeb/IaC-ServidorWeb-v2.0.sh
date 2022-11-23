#!/bin/bash
echo "Atualizando pacotes..."
apt-get update
apt-get upgrade -y

echo "Instalando pacotes..."
apt-get install apache2 -y
apt-get install unzip -y

echo "Reinicializando apache..."
systemctl restart apache2

echo "Baixando aplicação..."
echo "Forneça o endereço do arquivo .zip"
read ENDERECO

rm -rf /tmp/*
wget $ENDERECO -P /tmp --no-check-certificate
ARQUIVO=`ls -lt /tmp | awk 'NR==2 {print $9}'`

echo "Extraindo arquivos..."
unzip /tmp/$ARQUIVO -d /tmp/

DIRETORIO=`unzip -l /tmp/$ARQUIVO | awk 'NR==5 {print $4}'`

echo "Disponibilizando arquivos..."
cp -r /tmp/$DIRETORIO* /var/www/html