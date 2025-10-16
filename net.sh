#!/bin/bash read -p "provide the host " host echo "$host" 

echo "Scanning $host" nmap -sV $host > scan_result.txt 

echo " " echo "Open ports found:" 
cat scan_result.txt 

echo "-------------------------------------------------------------------------------------------" 

read -p "Enter port number to search for vulnerabilities:" port 

service=$(grep "^$port/tcp" scan_result.txt | grep -oE 'open[[:space:]]+[a-zA-Z0-9_-]+' | awk '{print $2}') 
#version=$(echo "$port" | sed -En 's/^[0-9]/tcp[[:space:]]open[[:space:]][^[:space:]][[:space:]](.)\1/p') 

read -p "provide version number for $service " version 
echo "$service , $version" 

msfconsole -r handler.rc 