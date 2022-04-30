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

#Terminal Colors
WHITE=$"\033[1;37m"

COLOR=$"\033[1;31m"




# ####################### TEST AREA START ######################

# ###################### TEST AREA END ######################

getScript

clear


##########################################
#check if the input is valid
#all possible options for each tool and script concatenated into a singular array


################################################
#check which option is selected


if [[ $SS == "add" ]] || [[ $SS == "custom" ]] || [[ $SS == "custom add" ]] || [[ $SS == "custom script" ]] || [[ $SS == "add custom" ]] || [[ $SS == "add script" ]] || [[ $SS == "m" ]] || [[ $SS == "ad" ]]; then
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

    until [ ! -f "custom_scripts/${si1}.sh" ]
    do
      getInput error "$current" "Options" "Please choose a name for your new script: " "Do not incldue a file extension" "Other Script Name"
      si1=$SI
    done

    cd custom_scripts
    touch "${si1}.sh"
    cd ../
    selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
    insertType=$SO
    if [[ $insertType == "1" ]]; then
      clear
      title
      
      echo -e "$WHITE  Current: ${COLOR}${current}$WHITE"
      echo -e "$WHITE  ---------------------------------------------"
      echo -e "$COLOR  $text"
      echo -e -n "$WHITE"
      echo " "
      
      echo -e "$WHITE    (\e[1;31mDETAILS$WHITE) press ctrl + d or type \"$COLOR~$WHITE\" when done"
      echo " "
      echo -e "$COLOR  Paste Here >$WHITE"
      read -r -d '~' script
boiler="
source ../functions.sh

title
echo -e \"$WHITE  Current: ${COLOR}${current}$WHITE\"
echo -e \"$WHITE  ---------------------------------------------\"
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

if [[ $SS == "settings" ]] || [[ $SS == "Settings" ]] || [[ $SS == "s" ]] || [[ $SS == "S" ]]; then
  current="Settings"

  selectOptions "" "$current" "Settings"  "Select Setting to Modify" "Select Existing Setting to modify" "settings.tropx"
  optionToChange=$SO

  if [[ $optionToChange == "1" ]]; then
    changeOption "Debug Mode"

    if [[ $newValue == "1" ]]; then
    echo "---------"

    
    fi
  fi


fi

######################################################