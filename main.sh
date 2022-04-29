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
NO_COLOR="\e[0m"

WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"

CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"

BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"

RED="\e[0;31m"
BOLD_RED="\e[1;31m"

#Temporary test function
function testColors() {
clear
echo -e "$NO_COLOR none ★"
echo -e "$WHITE white"
echo -e "$BOLD_WHITE bold white"
echo -e "$CYAN cyan"
echo -e "$BOLD_CYAN bold cyan ★"
echo -e "$BLUE cyan"
echo -e "$BOLD_BLUE bold cyan ★"
echo -e "$RED red"
echo -e "$BOLD_RED bold red"
echo -e "$NO_COLOR -------------------------------"
}




function containsElement() {
  match="$1"
  shift
  for e in "$@"; do 
    if [[ "$e" == "$match" ]]; then
      echo "0"
      return
    fi
  done
  echo "1"
}



function getScript() {
# Only display niceTitle on start
if [[ "$1" == "back" ]]; then
  okTitle
else
  niceTitle
fi

stty -echo

sleep 0.1
echo -e "$BOLD_RED  Available Scripts: "
echo -e -n "$BOLD_WHITE"
echo " "

#Some Options
sleep 0.1
echo -e "$BOLD_WHITE    (\e[1;31mS$BOLD_WHITE) Settings"
sleep 0.1
echo -e "$BOLD_WHITE    (\e[1;31mM$BOLD_WHITE) Manage Scripts"
sleep 0.1
echo -e "$BOLD_WHITE    (\e[1;31mH$BOLD_WHITE) Help"
sleep 0.1
echo "    ------------------"


export default_scripts=5

awk '{system("sleep 0.1");print "    (\033[1;31m" NR "\033[1;37m) " $0 }' < defaultScripts.txt

awk '{system("sleep 0.1");print "    (\033[1;31m" NR+ENVIRON["default_scripts"] "\033[1;37m) " $0 }' < defaultScripts.txt





echo -e " "

if [ "$1" == "error" ]
then
sleep 0.1
echo -n -e "$BOLD_RED  Select a Valid Option > "
else
sleep 0.1
echo -n -e "$BOLD_RED  Select Desired Script > "
fi

echo -n -e "$WHITE"

stty echo
read SS
SS=${SS,,}
}


getScript



clear






##########################################
#check if the input is valid
#all possible options for each tool and script concatenated into a singular array
manageScripts=("add" "custom" "custom add" "custom script" "add custom" "add script" "m")
settingsOptions=("s" "set" "options" "settings" "add custom" "add script" "custom script")


options=("${manageScripts[@]}" "${settingsOptions[@]}")



######################################

result="$(containsElement "$SS" "${options[@]}")"

if [[ "$result" != "0" ]]; then 
  until [[ "$result" == "0" ]] #unti the result is not an error
  do
    getScript error
    result="$(containsElement "$SS" "${options[@]}")"
  done
fi


################################################
#check which option is selected


if [[ $SS == "add" ]] || [[ $SS == "custom" ]] || [[ $SS == "custom add" ]] || [[ $SS == "custom script" ]] || [[ $SS == "add custom" ]] || [[ $SS == "add script" ]] || [[ $SS == "m" ]] || [[ $SS == "ad" ]]; then
  current="Manage Scripts"

#   Get a name (normal and lowercase version)
#   paste the script in rn or put the file in the scripts and then paste the     script path command to run it
  # cd scripts
  # bash changeIFmode.sh
  # cd ../

  selectOptions "" "$current" "New Script" "Modify Existing" "Delete Script"
  so1=$SO

  if [[ $so1 == "1" ]]; then
    #(1) New has been selected
    
    getInput "" "$current" "Please choose a name for your new script: " "Do not incldue a file extension" "Script Name"
    si1=$SI
    #check if filename exists

    until [ ! -f "scripts/${si1}.sh" ]
    do
      getInput error "$current" "Please choose a name for your new script: " "Do not incldue a file extension" "Other Script Name"
      si1=$SI
    done

    cd scripts
    touch "${si1}.sh"
    cd ../
    selectOptions "" "$current" "Paste script into terminal" "Paste path to script into terminal"
    insertType=$SO
    if [[ $insertType == "1" ]]; then
      clear
      title
      
      echo -e "$BOLD_WHITE  Current: ${BOLD_RED}${current}$BOLD_WHITE"
      echo -e "$BOLD_WHITE  ---------------------------------------------"
      echo -e "$BOLD_RED  $text"
      echo -e -n "$BOLD_WHITE"
      echo " "
      
      echo -e "$BOLD_WHITE    (\e[1;31mDETAILS$BOLD_WHITE) press ctrl + d or type \"$BOLD_RED~$BOLD_WHITE\" when done"
      echo " "
      echo -e "$BOLD_RED  Paste Here >$BOLD_WHITE"
      read -r -d '~' script
      echo " "

   
      # getInput "" "$current" "p: " "Do not incldue a file extension" "Script Name"
    fi
  fi
fi

#########################################################

if [[ $SS == "settings" ]] || [[ $SS == "Settings" ]] || [[ $SS == "s" ]] || [[ $SS == "S" ]]; then
  current="Settings"
  echo -e "$BOLD_WHITE  You have selected: ${BOLD_RED}${current}$BOLD_WHITE"
  echo " "
  #the variable is stored as SO 


fi

######################################################