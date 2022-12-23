#!/bin/bash

echo "Buildando as imagens..."
docker build -t henriquefonteboa/projeto-backend:1.0 backend/.
docker build -t henriquefonteboa/projeto-database:1.0 database/.

echo "Realizando push das imagens..."
docker push henriquefonteboa/projeto-backend:1.0
docker push henriquefonteboa/projeto-database:1.0

echo "Criando serviços no cluster..."
kubectl apply -f ./services.yml

echo "Criando os deployments...."
kubectl apply -f ./deployment.yml