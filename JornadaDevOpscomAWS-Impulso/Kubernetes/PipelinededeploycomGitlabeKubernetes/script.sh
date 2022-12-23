#!/bin/bash

echo "Criando serviços no cluster..."
kubectl apply -f ./loadbalancer.yml

echo "Ativando Secrets"
kubectl apply -f ./secrets.yml

echo "Iniciando Minikube"
minikube service --url app > .val

echo "Verificando IP de acesso no minikube"
IP="$(cat .val)"
# echo $IP
sed "s|add.php|$IP/add.php|g" ./app/js.js > ./app/js.txt
mv -f ./app/js.txt ./app/js.js

echo "Buildando as imagens..."
docker build -t henriquefonteboa/projeto-kubernetes2:1.0 app/.

echo "Realizando push das imagens..."
docker push henriquefonteboa/projeto-kubernetes2:1.0

echo "Criando os deployments...."
kubectl apply -f ./app-deployment.yml
kubectl apply -f ./mysql-deployment.yml