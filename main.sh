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


function end() {
clear
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$WHITE https://github.com/TroopekYT"
exit
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
title

echo -e "$BOLD_RED  Available Scripts: "
echo -e -n "$BOLD_WHITE"
echo " "

#Some Options
echo -e "$BOLD_WHITE    (\e[1;31mS$BOLD_WHITE) Settings"
echo -e "$BOLD_WHITE    (\e[1;31mA$BOLD_WHITE) Add Custom Script"
echo -e "$BOLD_WHITE    (\e[1;31mH$BOLD_WHITE) Help"
echo "    ------------------"


export default_scripts=5

awk '{ print "    (\033[1;31m" NR "\033[1;37m) " $0 }' < defaultScripts.txt

awk '{ print "    (\033[1;31m" NR+ENVIRON["default_scripts"] "\033[1;37m) " $0 }' < customScripts.txt




echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$BOLD_RED  Select a Valid option> "
else
echo -n -e "$BOLD_RED  Select Desired Script > "
fi

echo -n -e "$WHITE"

read SS
SS=${SS,,}
}







getScript



clear
title




##########################################
#check if the input is valid
#all possible options for each tool and script concatenated into a singular array
customScriptOptions=("add" "custom" "custom add" "custom script" "add custom" "add script" "a")
settingsOptions=("s" "set" "options" "settings" "add custom" "add script" "custom script")


options=("${customScriptOptions[@]}" "${settingsOptions[@]}")



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


if [[ $SS == "add" ]] || [[ $SS == "custom" ]] || [[ $SS == "custom add" ]] || [[ $SS == "custom script" ]] || [[ $SS == "add custom" ]] || [[ $SS == "add script" ]] || [[ $SS == "a" ]] || [[ $SS == "a" ]] || [[ $SS == "ad" ]]; then
  
  current="Add Custom Script"
  echo -e "$BOLD_WHITE  You have selected: ${BOLD_RED}${current}$BOLD_WHITE"
  echo " "


#   Get a name (normal and lowercase version)
#   paste the script in rn or put the file in the scripts and then paste the     script path command to run it
  
  
  ./scripts/changeIFmode.sh
  # sleep 100000
  selectOptions "" "$current" "New" "Modify Existing" 
  




fi



if [[ $SS == "settings" ]] || [[ $SS == "Settings" ]] || [[ $SS == "s" ]] || [[ $SS == "S" ]]; then
  current="Settings"
  echo -e "$BOLD_WHITE  You have selected: ${BOLD_RED}${current}$BOLD_WHITE"
  echo " "
 



fi

