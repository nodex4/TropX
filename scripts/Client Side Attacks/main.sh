#!/usr/bin/env bash
source main.sh
folder="custom_scripts/$current"
current="Client Side Attacks"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    


selectOptions "Client Side Attacks" "Selection" "Try another selection" "Gaining Access" "Social Engineering"
if [[ "$SO" == "1" ]]; then   # Gaining Access
  :
  # installPackages veil
  # veil
  # update
elif [[ "$SO" == "2" ]]; then # Social Engineering
  :
fi
