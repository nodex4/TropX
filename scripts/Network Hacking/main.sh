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
    getInput "Number of APs" "Enter the number of Access Points to generate." "1000"
    changeWImode monitor
    changeMac
    mdk3 $AD b -f ./random_wordlist.txt -a -s $N
  elif [[ "$SO" == "2" ]]; then # Wordlist
    getInput "Wordlist File" "Enter Wordlist Path." "/root/desktop/wordlist.txt"
    changeWImode monitor
    changeMac
    mdk3 $AD b -f "$SI" -a -s $(wc -l "$SI" | cut -f1 -d ' ')
  elif [[ "$SO" == "3" ]]; then # Specific
    getInput "Network Name" "Type a string" "xPWNEDx"
    string=$SI
    getInput "Number of APs" "Enter the number of Access Points to generate." "1000"
    N=$SI
    mdk3 $AD b -n "$string" -a
  fi
fi