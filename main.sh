#!/bin/bash

#  ____          _______                         _     
# |  _ \        |__   __|                       | |    
# | |_) |_   _     | |_ __ ___   ___  _ __   ___| | __ 
# |  _ <| | | |    | | '__/ _ \ / _ \| '_ \ / _ \ |/ / 
# | |_) | |_| |    | | | | (_) | (_) | |_) |  __/   <  
# |____/ \__, |    |_|_|  \___/ \___/| .__/ \___|_|\_\ 
#         __/ |                      | |               
#        |___/                       |_|               
# Github: https://github.com/TroopekYT/
source test.sh
source functions.sh


mainMenu


##########################################
#check if the input is valid
#all possible options for each tool and script concatenated into a singular array


################################################
#check which option is selected


if [[ $SS == "m" ]]; then
  current="Manage Scripts"

#   Get a name (normal and lowercase version)
#   paste the script in rn or put the file in the scripts and then paste the     script path command to run it
  # cd scripts
  # bash changeIFmode.sh
  # cd ../

  selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "New Script" "Modify Existing" "Delete Script"
  so1=$SO

  if [[ $so1 == "1" ]]; then
    #(1) New has been selected
    
    getInput "" "$current" "Options" "Please choose a name for your new script: " "Do not incldue a file extension" "Script Name"
    si1=$SI
    #check if filename exists

    until [ ! -f "custom_scripts/${si1}/" ]
    do
      getInput error "$current" "Options" "Please choose a name for your new script: " "Do not incldue a file extension" "Other Script Name"
      si1=$SI
    done

    cd custom_scripts
    touch "$si1/"
    touch "${si1}.sh"
    cd ../
    selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
    insertType=$SO
    if [[ $insertType == "1" ]]; then
      clear
      title
      
      echo -e "$PRIMARY  Current: ${SECONDARY}${current}$PRIMARY"
      echo -e "$PRIMARY  ---------------------------------------------"
      echo -e "$SECONDARY  $text"
      echo -e -n "$PRIMARY"
      echo " "
      
      echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) press ctrl + d or type \"$SECONDARY~$PRIMARY\" when done"
      echo " "
      echo -e "$SECONDARY  Paste Here >$PRIMARY"
      read -r -d '~' script
boiler="
source ../functions.sh

title
echo -e \"$PRIMARY  Current: ${SECONDARY}${current}$PRIMARY\"
echo -e \"$PRIMARY  ---------------------------------------------\"
echo \"\"

"
      echo "$boiler" >> "custom_scripts/${si1}.sh"
      echo "$script" >> "custom_scripts/${si1}.sh"
      echo "$si1" | sed -e "s/\b\(.\)/\u\1/g " >> "customScripts.txt"
   
      # getInput "" "$current" "p: " "Do not incldue a file extension" "Script Name"
    fi
  fi



fi

#########################################################

if [[ $SS == "s" ]]; then
  current="Settings"

  selectOptions "" "$current" "Settings"  "Select Setting to Modify" "Select Existing Setting to modify" "settings.tropx"
  optionToChange=$SO

  if [[ $optionToChange == "1" ]]; then
    changeOption "Debug Mode"
    
  fi

  
fi

######################################################