#!/usr/bin/env bash
source main.sh

current="Network Hacking"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    



selectOptions "Manage Mac & IP" "Selection" "Try another selection" "Wifi Cracking" "AP Spam"
if [[ "$SO" == "1" ]]; then   # Wifi Cracking
  :

elif [[ "$SO" == "2" ]]; then # AP Spam
  selectOptions "AP Spam" "Selection" "Try another selection" "Random Network Names" "Network Names from Worldist" "Specific Network Names"
  if [[ "$SO" == "1" ]]; then   # Random
    # getInput "Number of APs" "Enter the number of Access Points to generate." "1000"
    changeWImode monitor
    changeMac
    mdk3 $WI b #-f "./random_wordlist.txt" -s 1000
  elif [[ "$SO" == "2" ]]; then # Wordlist
    getInput "Wordlist File" "Enter Wordlist Path." "/root/desktop/wordlist.txt"
    changeWImode monitor
    changeMac
    mdk3 $WI b -f "$SI"-a  -s 1000
  elif [[ "$SO" == "3" ]]; then # Specific
    getInput "Network Name" "Type a string" "xPWNEDx"
    string=$SI
    getInput "Number of APs" "Enter the number of Access Points to generate." "1000"
    N=$SI
    COUNT=1
    while [ $COUNT -lt $N ] || [ $COUNT -eq $N ]; do
      echo $string $COUNT >> "$string.txt"
      let COUNT=COUNT+1
    done
    mdk3 $WI b -f "./$string.txt"-a  -s 1000 && rm "./$string.txt"
    # mdk3 $WI b -n "$string"-a  -s $N
  fi
fi
