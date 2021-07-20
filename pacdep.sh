#!/bin/bash
for i in "${@}"
do
let x+=1
[[ $x == 1 ]] && echo "Packages dependent on..."
echo -e "\e[1m$i:\e[0m"
paclist=$(LC_ALL=C pacman -Qi "$i" 2>/dev/null|gawk -F" : " '/.equired/{if($2!="None"){print $2}}')
[[ ! -z $paclist ]] && LC_ALL=C pacman -Qi $paclist|gawk -F": " '/^Name/{n="\033[1;32m "$2"\033[0m";next}/^Description/{print n " \033[3m" $2"\033[0m"}'
done
