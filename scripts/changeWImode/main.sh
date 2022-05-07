#!/bin/bash
source functions.sh

current="Change WI Mode"
ready
# to reference files use a similar path "scripts/changeWImode/foo.txt"
#######################################################

selectOptions "" "$current" "Select Wireless Interface Mode" "Select a Mode" "Select a Valid Mode" "Monitor" "Managed" "Change Default Wireless Interface"
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