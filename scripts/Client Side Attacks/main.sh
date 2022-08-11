#!/usr/bin/env bash
source main.sh
folder="custom_scripts/$current"
current="Client Side Attacks"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    


selectOptions "Client Side Attacks" "Selection" "Try another selection" "Gaining Access" "Social Engineering"
if [[ "$SO" == "1" ]]; then   # Gaining Access
  :
  installPackages veil
    
  expect -c "
  set timeout -1
  spawn \"veil\"
  expect \"Veil>: \"
  send -- \"update\r\"
  send -- \"\r\"
  expect \"Veil>: \"
  send -- \"use\r\"
  interact
  "

elif [[ "$SO" == "2" ]]; then # Social Engineering
  :
fi
