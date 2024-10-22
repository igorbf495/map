#!/bin/bash

read -p "Digite a rede a ser escaneada (exemplo: 192.168.1.0/24): " NETWORK

if ! command -v nmap &> /dev/null
then
    echo "nmap não está instalado. Instalando nmap..."
    sudo apt update && sudo apt install -y nmap
fi

echo "Coletando IPs ativos na rede $NETWORK..."
nmap -sn $NETWORK | grep "Nmap scan report for" | awk '{print $NF}' | tr -d '()'

echo "Varredura concluída."
