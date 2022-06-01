#!/usr/bin/env bash
source main.sh

current="Manage Mac Address"
ready
title
breadcrumbs "$current" "Manage Mac Address"
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "Select New Mac Address" "Select a Option" "Select a Valid Option" "Specific Mac" "Random Mac" "Reset to Permanent Mac"
choice=$SO
if [[ "$choice" == "1" ]]; then
  getInput "New Mac Address" "Provide a new valid Mac Address" "21:15:19:1D:13:BE"
  manageMac "$SI"
elif [[ "$choice" == "2" ]]; then
  changeWImode managed
elif [[ "$choice" == "3" ]]; then
  optionToChange=$(grep -n "Wireless Interface" settings.tropx | cut -d: -f1)
  setting=$(sed ${optionToChange}!d settings.tropx)
  setting=$(echo $setting | sed 's/ :.*//')
  changeOption "$setting" setup
fi