#!/usr/bin/env bash
source main.sh

current="Manage Mac & IP"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "Manage Mac & IP" "Selection" "Try another selection" "Manage Mac Address" "Manage IP"
if [[ "$SO" == "1" ]]; then  # Mange Mac Address
  selectOptions "Select New Mac Address" "Select a Option" "Select a Valid Option" "Random Mac" "Specific Mac" "Reset to Permanent Mac"
  choice=$SO
  if [[ "$choice" == "1" ]]; then
    changeMac 
  elif [[ "$choice" == "2" ]]; then
    getInput "Mac Address" "Type the new mac address" "52:53:B7:37:8A:42"
    changeMac "$SI"
  elif [[ "$choice" == "3" ]]; then
    changeMac reset
  fi
elif [[ "$SO" == "2" ]]; then # Manage IP
  selectOptions "Select New IP Address" "Select a Option" "Select a Valid Option" "Random IP" "Specific IP" "Reset to Default IP"
  if [[ "$choice" == "1" ]]; then
    changeIP
  elif [[ "$choice" == "2" ]]; then
    getInput "IP Address" "Type the new IP address" "132.52.98.162"
    changeIP "$SI"
  elif [[ "$choice" == "3" ]]; then
    changeIP reset
  fi
fi