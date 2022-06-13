#!/usr/bin/env bash
source main.sh

current="Network Hacking"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "Network Hacking" "Selection" "Try another selection" "Manage Mac Address" "Manage Wireless Interface" "Manage IP" "WiFi Cracking" "Wifi AP Spam" 
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
elif [[ "$SO" == "2" ]]; then # Manage Wireless Interface
  selectOptions "Select Wireless Interface Mode" "Select a Mode" "Select a Valid Mode" "Monitor" "Managed" "Change Default Wireless Interface Name"
  choice=$SO
  if [[ "$choice" == "1" ]]; then
    changeWImode monitor
  elif [[ "$choice" == "2" ]]; then
    changeWImode managed
  elif [[ "$choice" == "3" ]]; then
    optionToChange=$(grep -n "Wireless Interface" settings.tropx | cut -d: -f1)
    setting=$(sed ${optionToChange}!d settings.tropx)
    setting=$(echo $setting | sed 's/ :.*//')
    changeOption "$setting" setup
  fi
elif [[ "$SO" == "3" ]]; then # Manage IP
  :
elif [[ "$SO" == "4" ]]; then # Wifi Cracking
  :
elif [[ "$SO" == "5" ]]; then # Wifi AP Spam
  :
fi