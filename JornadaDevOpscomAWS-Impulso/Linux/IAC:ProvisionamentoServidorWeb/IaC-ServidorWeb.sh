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
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp --no-check-certificate

echo "Extraindo arquivos..."
unzip /tmp/main.zip -d /tmp/

echo "Disponibilizando arquivos..."
cp -r /tmp/linux-site-dio-main/* /var/www/html