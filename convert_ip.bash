#!/bin/bash

# Vérifie si un argument a été fourni
if [ -z "$1" ]; then
  echo "Utilisation : ./script.bash <adresse IPv4>"
  exit 1
fi

# Sépare l'adresse IP en entrée par des points et convertit chaque partie en binaire
ip=$1
IFS='.' read -r octet1 octet2 octet3 octet4 <<< "$ip"

# Convertir chaque octet en binaire
binary_octet1=$(printf "%08d" $(echo "obase=2; $octet1" | bc))
binary_octet2=$(printf "%08d" $(echo "obase=2; $octet2" | bc))
binary_octet3=$(printf "%08d" $(echo "obase=2; $octet3" | bc))
binary_octet4=$(printf "%08d" $(echo "obase=2; $octet4" | bc))

# Combiner les octets binaires avec des points
binary_ip="$binary_octet1.$binary_octet2.$binary_octet3.$binary_octet4"

# Afficher le résultat
echo "Représentation binaire de $ip : $binary_ip"
