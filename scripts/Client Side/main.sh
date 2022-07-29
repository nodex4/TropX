#!/usr/bin/env bash
source main.sh
folder="custom_scripts/$current"
current="Client Side"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "Client Side Attacks" "Selection" "Try another selection" "Wifi Cracking" "Beacon Flooding" "Deauth Attack"
if [[ "$SO" == "1" ]]; then   # Wifi Cracking
  :

elif [[ "$SO" == "2" ]]; then # Beacon Flooding
  :
fi
