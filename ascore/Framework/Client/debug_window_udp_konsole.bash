#!/bin/bash
echo "Lanzando ventana"
konsole -title "Debug CoreG2"  -e bash -c 'while [ 1 ]; do netcat -u -l -p 7869;clear;done' 
