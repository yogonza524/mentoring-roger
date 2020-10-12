#! /bin/bash

echo "[1/5] Updating system..."
sudo apt-get update

echo "[2/5] Installing Java 8..."
sudo apt-get -y install openjdk-8-jre-headless

cd /opt

echo "[3/4] Creating services folder"
sudo mkdir services
cd services

echo "[4/5] Downloading app..."
sudo wget http://github.com/RogelioDavid/apps/raw/master/app.jar

echo "[5/5] Running app..."
java -DAPP_ENV=gcp -jar app.jar > ${HOME}/logs.log &
