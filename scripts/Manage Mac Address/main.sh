#!/usr/bin/env bash
source main.sh

current="Manage Mac Address"
ready
title
breadcrumbs "$current" "Manage Mac Address"
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

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