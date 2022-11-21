#!/bin/bash

echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec
echo "Diretorios criados."

echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo "Grupos criados."

echo "Criando usuários"
useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd carlos -e


useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd maria -e


useradd joao -c "João" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd joao -e


useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd debora -e


useradd sebastiana -c "Sebastiana" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd sebastiana -e


useradd roberto -c "Roberto" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd roberto -e


useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd josefina -e


useradd amanda -c "Amanda" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd amanda -e


useradd rogerio -c "Rogerio" -s /bin/bash -m -p $(openssl passwd SenhaAlterar123)
passwd rogerio -e

echo "Adicionando os usuários nos grupos..."
usermod -G GRP_ADM carlos
usermod -G GRP_ADM maria
usermod -G GRP_ADM joao
usermod -G GRP_VEN debora
usermod -G GRP_VEN sebastiana
usermod -G GRP_VEN roberto
usermod -G GRP_SEC josefina
usermod -G GRP_SEC amanda
usermod -G GRP_SEC rogerio
echo "Usuários adicionados."


echo "Definindo permissões nos diretorios..."
chmod 777 /publico
chown root:GRP_ADM /adm
chmod 770 /adm
chown root:GRP_VEN /ven
chmod 770 /ven
chown root:GRP_SEC /sec
chmod 770 /sec
echo "Permissões definidas."
echo "Finalizado..."
