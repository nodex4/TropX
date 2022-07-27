#!/usr/bin/env bash
source main.sh
current="Bad Usb"
folder="scripts/$current"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "Bad USB" "Selection" "Try another selection" "MalduinoW.tools" "Ducky Flasher"

if [[ "$SO" == "1" ]]; then   # MalduinoW.tools
  xdg-open http://192.168.4.1
elif [[ "$SO" == "2" ]]; then # Ducky Flasher
  :
fi