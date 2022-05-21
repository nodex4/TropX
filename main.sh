#!/usr/bin/env bash

#  ____        _______                         _     
# |  _ \      |__   __|                       | |    
# | |_) |_   _   | |_ __ ___   ___  _ __   ___| | __ 
# |  _ <| | | |  | | '__/ _ \ / _ \| '_ \ / _ \ |/ / 
# | |_) | |_| |  | | | | (_) | (_) | |_) |  __/   <  
# |____/ \__, |  |_|_|  \___/ \___/| .__/ \___|_|\_\ 
#         __/ |                    | |               
#      |___/                     |_|   
# Github: https://github.com/Troopek/

source customIfs.sh

trap end EXIT

function checkSettings() {
  setting=$(grep "^$1 :" settings.tropx | \
    cut "-d:" -f2- | \
      cut "-d " -f2-)

  text=$1
  value=$(echo "$setting" | awk -F"[()]" '{print $2}' )
  options=$(echo "$value $setting" | awk '{gsub("[(][^)]*[)]","")}1' )
  listOptions=$(echo "$setting" | sed 's/| //g' )
}
################################################################################################################

function ready() {
#Terminal Colors
# if [[ "$1" == "custom" ]]; then
# checkSettings "Primary Color" custom
# else
# fi

checkSettings "Primary Color"

primary=$value
case $primary in
  "RED")PRIMARY=$"\033[1;31m";;
  "WHITE")PRIMARY=$"\033[1;37m";;
  "BLUE")PRIMARY=$"\033[1;34m";;
  "GREEN")PRIMARY=$"\033[1;32m";;
  "CYAN")PRIMARY=$"\033[1;36m";;
  "PINK")PRIMARY=$"\033[1;35m";;
  "YELLOW")PRIMARY=$"\033[1;33m";;
  "GRAY")PRIMARY=$"\033[1;30m";;
  *)PRIMARY=$"\033[1;37m";;
esac


# if [[ "$1" == "custom" ]]; then
# checkSettings "Secondary Color" custom
# else
# checkSettings "Secondary Color"
# fi

checkSettings "Secondary Color"

secondary=$value
case $secondary in
  "RED")SECONDARY=$"\033[1;31m";;
  "WHITE")SECONDARY=$"\033[1;37m";;
  "BLUE")SECONDARY=$"\033[1;34m";;
  "GREEN")SECONDARY=$"\033[1;32m";;
  "CYAN")SECONDARY=$"\033[1;36m";;
  "PINK")SECONDARY=$"\033[1;35m";;
  "YELLOW")SECONDARY=$"\033[1;33m";;
  "GRAY")SECONDARY=$"\033[1;30m";;
  *)SECONDARY=$"\033[1;37m";;
esac
}
ready



################################################################################################################


function end() {
  clear
  stty -echo
  
  checkSettings "Animations"
  animations=$value
  
  # Set WI to managed
  ifconfig $WI down > /dev/null 2>&1
  macchanger -p $WI > /dev/null 2>&1
  iwconfig $WI mode managed > /dev/null 2>&1
  ifconfig $WI up > /dev/null 2>&1
  nmcli device connect $WI > /dev/null 2>&1
  
  if [[ "$animations" == "ON" ]]; then
    echo " "
    sleep 01
    echo -e -n "$PRIMARY  Thanks For Using"
    echo -e "$SECONDARY TropX" | pv -qL 15
    sleep 01
    echo -e "$PRIMARY  My GitHub:$SECONDARY https://github.com/troopek"
    sleep 01
    echo " "
  else
    echo " "
    echo -e "$PRIMARY  Thanks For Using$SECONDARY TropX"
    echo -e "$PRIMARY  My GitHub:$SECONDARY https://github.com/troopek"
    echo " "
  fi
  
  exit
}

################################################################################################################

function breadcrumbs() {
  COLUMNS="$(tput cols)"
  checkSettings "Text Folding"; textfolding=$value;
  tabs 4
  fold_width="$(($(tput cols)-6))"

  checkSettings "Animations"
  animations=$value

  checkSettings "Breadcrumbs"
  breadcrumbs=$value
  
  if [[ "$3" == "error" ]] || [[ "$3" == "back" ]] || [[ $animations == "OFF" ]] || ([[ $animations == "MINIMAL" ]] && [[ "$3" == "back" ]]) || ([[ $animations == "MINIMAL" ]] && [[ "$3" != "main" ]]); then
    if [[ "$breadcrumbs" == "ON" ]]; then
      echo -e "${PRIMARY}Current: $SECONDARY$1$PRIMARY" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi


      if [[ $COLUMNS > 53 ]]; then
        echo -e "$PRIMARY    ---------------------------------------------"
      else
        echo -e "$PRIMARY    ----------------------"
      fi

      


    else
      :
    fi

    echo -e "$PRIMARY$2: " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
    echo " "
  else
    echo -e "${PRIMARY}Current: $SECONDARY$1$PRIMARY" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
    sleep 0.1
    echo -e "$PRIMARY    ---------------------------------------------"
    sleep 0.1
    echo -e "$PRIMARY$2: " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
    sleep 0.1
    echo " "
  fi

  tabs 6
  fold_width="$(($(tput cols)-6))"
}

################################################################################################################


function title() {

t="
  $PRIMARY▄▄▄█████▓
  ▓  ██▒ ▓▒
  ▒ ▓██░ ▒░
  ░ ▓██▓ ░ 
    ▒██▒ ░ 
    ▒ ░░   
      ░    
    ░      
         
         "
tr="
  ▄▄▄█████▓ ██▀███  
  ▓  ██▒ ▓▒▓██ ▒ ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒
  ░ ▓██▓ ░ ▒██▀▀█▄  
    ▒██▒ ░ ░██▓ ▒██▒
    ▒ ░░   ░ ▒▓ ░▒▓░
      ░      ░▒ ░ ▒░
    ░        ░░   ░ 
            ░     
                  "
tro="
  ▄▄▄█████▓ ██▀███   ▒█████  
  ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
  ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
    ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
    ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
      ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
    ░        ░░   ░ ░ ░ ░ ▒  
              ░         ░ ░  
                           "
trop="
  ▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
  ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
  ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
    ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
    ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
      ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
    ░        ░░   ░ ░ ░ ░ ▒  ░░       
              ░         ░ ░           
                                    "

tropx="
  $PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
  $PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
  $PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
  $PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
  $PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
  $PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
  $PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
  $PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
  $PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  
                                                                    "

minitropx="
  $PRIMARY▄▄▄█████▓   $SECONDARY▒██   ██▒
  $PRIMARY▓  ██▒ ▓▒   $SECONDARY▒▒ █ █ ▒░
  $PRIMARY▒ ▓██░ ▒░   $SECONDARY░░  █   ░
  $PRIMARY░ ▓██▓ ░    $SECONDARY ░ █ █ ▒ 
  $PRIMARY  ▒██▒ ░    $SECONDARY▒██▒ ▒██▒
  $PRIMARY  ▒ ░░     $SECONDARY ▒▒ ░ ░▓ ░
  $PRIMARY    ░      $SECONDARY ░░   ░▒ ░
  $PRIMARY  ░        $SECONDARY  ░    ░  
  $PRIMARY           $SECONDARY  ░    ░  
                     "

clear

COLUMNS="$(tput cols)"
if [[ $COLUMNS -lt 53 ]]; then
  echo -e "$minitropx"
  echo -e -n "$PRIMARY"
else
  echo -e "$tropx"
  echo -e -n "$PRIMARY                                       "
  echo -e "By$SECONDARY Troopek  "
  echo " "
fi


}

################################################################################################################


function niceTitle() {


t="
  $PRIMARY▄▄▄█████▓
  ▓  ██▒ ▓▒
  ▒ ▓██░ ▒░
  ░ ▓██▓ ░ 
    ▒██▒ ░ 
    ▒ ░░   
      ░    
    ░      
         
         "
tr="
  ▄▄▄█████▓ ██▀███  
  ▓  ██▒ ▓▒▓██ ▒ ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒
  ░ ▓██▓ ░ ▒██▀▀█▄  
    ▒██▒ ░ ░██▓ ▒██▒
    ▒ ░░   ░ ▒▓ ░▒▓░
      ░      ░▒ ░ ▒░
    ░        ░░   ░ 
            ░     
                  "
tro="
  ▄▄▄█████▓ ██▀███   ▒█████  
  ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
  ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
    ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
    ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
      ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
    ░        ░░   ░ ░ ░ ░ ▒  
              ░         ░ ░  
                           "
trop="
  ▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
  ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
  ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
    ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
    ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
      ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
    ░        ░░   ░ ░ ░ ░ ▒  ░░       
              ░         ░ ░           
                                    "

tropx="
  $PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
  $PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
  $PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
  $PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
  $PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
  $PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
  $PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
  $PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
  $PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  
                                                                    "


minitropx="
  $PRIMARY▄▄▄█████▓   $SECONDARY▒██   ██▒
  $PRIMARY▓  ██▒ ▓▒   $SECONDARY▒▒ █ █ ▒░
  $PRIMARY▒ ▓██░ ▒░   $SECONDARY░░  █   ░
  $PRIMARY░ ▓██▓ ░    $SECONDARY ░ █ █ ▒ 
  $PRIMARY  ▒██▒ ░    $SECONDARY▒██▒ ▒██▒
  $PRIMARY  ▒ ░░     $SECONDARY ▒▒ ░ ░▓ ░
  $PRIMARY    ░      $SECONDARY ░░   ░▒ ░
  $PRIMARY  ░        $SECONDARY  ░    ░  
  $PRIMARY           $SECONDARY  ░    ░  
                     "



clear



COLUMNS="$(tput cols)"
if [[ $COLUMNS -lt 53 ]]; then
  sleep 1
  echo -e "$minitropx"
  sleep 0.3
  echo -e -n "$PRIMARY"
  sleep 0.1
else
  sleep 1
  
  echo -e "$t"
  sleep 0.15
  clear
  echo -e "$tr"
  sleep 0.15
  clear
  echo -e "$tro"
  sleep 0.15
  clear
  echo -e "$trop"
  
  sleep 0.3
  clear
  echo -e "$tropx"
  
  echo -e -n "$PRIMARY                                     "
  echo -e "By$SECONDARY Troopek  " | pv -qL 15
  echo " "
  sleep 0.1
fi



}

################################################################################################################

function mainMenu() {
checkSettings "Wireless Interface"
WI=$value
checkSettings "Text Folding"; textfolding=$value;
stty -echo
current="Main Menu"

checkSettings "Animations"
animations=$value


if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
title
breadcrumbs "$current" "Available Scripts and Tools" back
else
niceTitle
breadcrumbs "$current" "Available Scripts and Tools" main
fi

tabs 6
fold_width="$(($(tput cols)-6))"



if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then

  echo -e "$PRIMARY(${SECONDARY}S$PRIMARY) Settings" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  echo -e "$PRIMARY(${SECONDARY}M$PRIMARY) Manage Scripts" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  echo -e "$PRIMARY(${SECONDARY}H$PRIMARY) Help" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  echo "      ------------------"

else

  sleep 0.1
  echo -e "$PRIMARY(${SECONDARY}S$PRIMARY) Settings" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  sleep 0.1
  echo -e "$PRIMARY(${SECONDARY}M$PRIMARY) Manage Scripts" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  sleep 0.1
  echo -e "$PRIMARY(${SECONDARY}H$PRIMARY) Help" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  sleep 0.1
  echo "      ------------------"


fi





default_scripts=$(wc -l < script_names/defaultScripts.txt)

custom_scripts=$(wc -l < script_names/customScripts.txt)
scripts=$(expr $default_scripts + $custom_scripts)


default_scripts=$((default_scripts+1))
export default_scripts

if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then

  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "("SECONDARY NR PRIMARY") " $0
      }
  ' script_names/defaultScripts.txt | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
      }
  ' script_names/customScripts.txt | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  

else

  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "("SECONDARY NR PRIMARY") " $0
      }
  ' script_names/defaultScripts.txt | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
      }
  ' script_names/customScripts.txt | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  sleep 0.1

fi




echo -e " "

tabs 4
fold_width="$(($(tput cols)-6))"


if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
  if [[ "$1" == "error" ]]; then
  echo -n -e "${SECONDARY}Select a Valid Option > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
  else
  echo -n -e "${SECONDARY}Select Desired Option > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
  fi
else
  sleep 0.1
  echo -n -e "${SECONDARY}Select Desired Option > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
fi


echo -n -e "$PRIMARY"

stty echo
read SS
SS=${SS,,}


scriptCount=$((scripts + 1))
numberOptions=$(echo $(seq $scriptCount))

options=("s" "m" "h" $numberOptions)

if [[ $(containsElement "$SS" "${options[@]}") != "0" ]]; then 
  until [[ $(containsElement "$SS" "${options[@]}") == "0" ]] #unti the result is not an error
  do
    mainMenu error
    result="$(containsElement "$SS" "${options[@]}")"
  done
fi
clear


if [[ $SS == "m" ]]; then
  current="Manage Scripts"
#   paste the script in rn or put the file in the scripts and then paste the     script path command to run it
  # cd scripts
  # bash changeIFmode.sh
  # cd ../

  selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "New Script" "Modify Existing" "Delete Script"
  so1=$SO

  if [[ $so1 == "1" ]]; then #NEW
    getInput "" "$current" "Please choose a name for your new script" "Do not incldue a file extension" "Script Name"
    si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")

    until [ ! -f "custom_scripts/${si1}/main.sh" ]
    do
      getInput error "$current" "Options" "Please choose a name for your new script" "This will be the one which will be displayed in the Main Menu and in other places" "Custom Script Name"
      si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
    done

  selectOptions "" "$current" "Script/ Tool Language" "Select Script Language" "Select Valid Script Language" "Bash" "Python" "Import Repo from GitHub"
      language="$SO"

case "$language" in
  "1")  #bash
    boiler='#!/usr/bin/env bash
source main.sh

current="'"$si1"'"
ready
title
breadcrumbs "$current" "'"$si1"'"
cd "custom_scripts/"
cd "'"$si1"'/"
trap end EXIT
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
'

    ;;
  "2") #python
      boiler='#!/usr/bin/env python3
import os
os.chdir("custom_scripts/'"$si1"'/")
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
'
    ;;
  "3") #github
    getInput "" "$current" "Github Link" "Copy the link of the repo from the browser" "https://github.com/troopek/TropX"
    link="$SI"

    selectOptions "" "$current" "Main Language of this Script/ Tool" "Main Language" "Select Valid Script Language" "Bash" "Python" 
    case "$SO" in
      "1") #bash
        githubLanguage="bash"
        ;;
      "2") #python
        githubLanguage="python3"
        ;;
    esac
    getInput "" "$current" "Main File Name" "What is the main file name that has to be run for the tool/ script to start (Yes, include a file extension)" "run_TropX.py"
    mainfile=$SI
    ;;

esac

    if [[ "$language" != "3" ]]; then
      selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
      insertType=$SO
      
  
      if [[ $insertType == "1" ]]; then #paste
        clear
        title
        breadcrumbs "$current" "Options"
        
        echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) press ctrl + d or type \"$SECONDARY~$PRIMARY\" when done"
        echo " "
        echo -e "$SECONDARY  Paste Here > $PRIMARY" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
        read -r -d '~' script
      fi
  
      if [[ $insertType == "2" ]]; then #path
        getInput "" "$current" "Read Below" "Please type in the relative or full path of the script: " "Do not incldue a file extension" "/root/desktop/script_text.txt"
      path=$( echo $SI | sed 's/ //g')
  
        until [ -f $path ]
        do
          getInput error "$current" "Read Below" "Please type in the relative or full path of the script: " "Do not incldue a file extension" "/root/desktop/script_text.txt"
          path=$SI
        done
        script=$(<$path)  
      fi
    fi




    cd custom_scripts
    mkdir "$si1"
    cd "$si1"

    case "$language" in
      "1") #bash
        touch main.sh
        ;;
      "2") #python
        touch main.py
        ;;
      "3") #github
        git clone "$link" .
        ;;

    esac

    cd ../../

    case "$language" in
      "1") #bash
        echo "$boiler" >> "custom_scripts/${si1}/main.sh"
        echo "$script" >> "custom_scripts/${si1}/main.sh"
        sed '$s/}$//' < customIfs.sh > customIfs.sh.tmp
        mv customIfs.sh.tmp customIfs.sh
        ;;
      "2") #python
        echo "$boiler" >> "custom_scripts/${si1}/main.py"
        echo "$script" >> "custom_scripts/${si1}/main.py"
        sed '$s/}$//' < customIfs.sh > customIfs.sh.tmp
        mv customIfs.sh.tmp customIfs.sh
        ;;
      "3") #github
        sed '$s/}$//' < customIfs.sh > customIfs.sh.tmp
        mv customIfs.sh.tmp customIfs.sh
        ;;

    esac

    
    case "$language" in
      "1") $bash
        ifBoiler='
if [[ $(sed $((SS - default_scripts))!d script_names/customScripts.txt) == "'"${si1}"'" ]]; then
  bash "custom_scripts/'"${si1}"'/main.sh"
fi
}'
        ;;
      "2") #python
        ifBoiler='
if [[ $(sed $((SS - default_scripts))!d script_names/customScripts.txt) == "'"${si1}"'" ]]; then
  python3 "custom_scripts/'"${si1}"'/main.py"
fi
}'
        ;;
      "3") #github
        ifBoiler='
if [[ $(sed $((SS - default_scripts))!d script_names/customScripts.txt) == "'"${si1}"'" ]]; then
  cd "custom_scripts/'"${si1}"'/"
  '"${githubLanguage}"' "'"${mainfile}"'"
  cd ../../
fi
}'
        ;;

    esac

    
    echo "$ifBoiler" >> customIfs.sh

    echo "$si1" | sed -e "s/\b\(.\)/\u\1/g " >> "script_names/customScripts.txt"
  
    Message="To edit the selected script or add additional files in it's file tree, please navigate to custom_scripts/"$scriptToEdit" and commit your changes there! TropX will now restart so your changes take effect."
    message "$current" "Message" "$Message"
    exit 
  fi

  if [[ $so1 == "2" ]]; then
    


    customScriptNames=$(<script_names/customScripts.txt)

    SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
    IFS=$'\n'      # Change IFS to newline char
    customScriptNames=($customScriptNames) # split the `customScriptNames` string into an array by the same name
    IFS=$SAVEIFS   # Restore original IFS


    selectOptions "" "$current" "Script to Edit" "Select Script to Edit" "Select a Valid Script"  "${customScriptNames[@]}"

    scriptToEdit=$(sed "${SO}!d" script_names/customScripts.txt)

    Message="To edit the selected script or add additional files in it's file tree, please navigate to custom_scripts/"$scriptToEdit" and commit your changes there!"
    message "$current" "Message" "$Message"
  fi



  if [[ $so1 = "3" ]]; then
    customScriptNames=$(<script_names/customScripts.txt)

    SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
    IFS=$'\n'      # Change IFS to newline char
    customScriptNames=($customScriptNames) # split the `customScriptNames` string into an array by the same name
    IFS=$SAVEIFS   # Restore original IFS


    selectOptions "" "$current" "Script to Delete" "Select Script to Delete" "Select a Valid Script to Delete" "${customScriptNames[@]}"

    scriptToDelete=$(sed "${SO}!d" script_names/customScripts.txt)

    grep -v "$scriptToDelete" script_names/customScripts.txt > script_names/customScripts.tmp
    mv script_names/customScripts.tmp script_names/customScripts.txt
    
    sed '/"'"${scriptToDelete}"'"/,/^fi$/d' customIfs.sh > customIfs.tmp
    mv customIfs.tmp customIfs.sh


    cd custom_scripts
    rm -r "${scriptToDelete}"
    cd ../

    exit

  fi
fi

#########################################################

if [[ $SS == "s" ]]; then
  current="Settings"
  selectOptions "" "$current" "Settings"  "Select Setting to Modify" "Select Existing Setting to modify" "settings.tropx"
  optionToChange=$SO

  if [[ $optionToChange == "1" ]]; then
    setting=$(sed ${optionToChange}!d settings.tropx)
    setting=$(echo $setting | sed 's/ :.*//')
    changeOption "$setting"
  fi

  if [[ $optionToChange == "2" ]]; then
    setting=$(sed ${optionToChange}!d settings.tropx)
    setting=$(echo $setting | sed 's/ :.*//')
    changeOption "$setting"
  fi

  
fi


if [[ $SS == "h" ]]; then
  current="Help"
  helpMessage="To learn how to efficiently use ${SECONDARY}TropX${PRIMARY}, please refer to it's github:
${SECONDARY}https://github.com/troopek/TropX${PRIMARY}"
  message "$current" "Message" "$helpMessage"
fi



if [[ $SS == "1" ]]; then
  bash "scripts/changeWImode/main.sh"
fi
if [[ $SS == "2" ]]; then
  echo "2"
fi
if [[ $SS == "3" ]]; then
  echo "3"
fi





customIFs
mainMenu back
}


################################################################################################################

function selectOptions() {
checkSettings "Text Folding"; textfolding=$value;
stty -echo

tabs 6
fold_width="$(($(tput cols)-6))"

checkSettings "Animations"
animations=$value

title
if [[ "$1" != "setup" ]]; then
  breadcrumbs "$2" "$3"
else
breadcrumbs "Setup" "Available Wireless Interfaces"
fi

if [[ "$1" != "setup" ]]; then
echo -e "$PRIMARY(${SECONDARY}B$PRIMARY) Back To Main Menu" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
fi

if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  :
else
sleep 0.1
fi

if [[ "$1" != "setup" ]]; then
  echo "      ------------------"
fi

if [[ $6 == "settings.tropx" ]]; then
  if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "("SECONDARY NR PRIMARY") " $0
      }
  ' settings.tropx | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  # awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
  #     {
  #         print "    ("SECONDARY NR PRIMARY") " $0 | fold -s -w "$fold_width" | sed -e "s|^|\t|g"
  #     }
  # ' settings.tropx
  else
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "("SECONDARY NR PRIMARY") " $0
      }
  ' settings.tropx | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  fi
else
  if [[ $6 != "" ]]; then
    echo -e "$PRIMARY(${SECONDARY}1$PRIMARY) $6" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
    i=2
  fi
fi

if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  for arg in "${@:7}"
  do
      echo -e "${PRIMARY}(${SECONDARY}${i}$PRIMARY) ${arg}" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
      i=$((i+1))

  done
else
  for arg in "${@:7}"
  do
      echo -e "${PRIMARY}(${SECONDARY}${i}$PRIMARY) ${arg}" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
      i=$((i+1))
      sleep 0.1
  done
fi



echo -e " "

tabs 4
fold_width="$(($(tput cols)-6))"

if [ "$1" == "error" ]
then
echo -n -e "$SECONDARY$5 > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
else
echo -n -e "$SECONDARY$4 > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
fi

echo -n -e "$PRIMARY"
stty echo
read SO
SO=${SO,,}

if [[ $SO == "b" ]]; then
  mainMenu error
fi

arguments="$(($#-5))"
selection="$(seq 1 $arguments)"

if [[ "$(containsElement "$SO" ${selection[@]})" != "0" ]]; then 
  until [[ "$(containsElement "$SO" "${selection[@]}")" == "0" ]] #unti the result is not an error
  do
    selectOptions "error"  "$2" "$3" "$4" "$5" "$6" "${@:7}" #$stringed
  done
fi
}

################################################################################################################

function getInput() {
checkSettings "Text Folding"; textfolding=$value;
stty -echo

title
breadcrumbs "$2" "$3"


tabs 6
fold_width="$(($(tput cols)-6))"


if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  # if [[ $4 != "" ]]; then
    echo -e "$PRIMARY(\e[1;31mDETAILS$PRIMARY) $4" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
    echo " "
  # fi
  # if [[ $5 != "" ]]; then
    echo -e "$PRIMARY(\e[1;31mEXAMPLE$PRIMARY) $5" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
  # fi


else
  # if [[ $4 != "" ]]; then
    echo -e "$PRIMARY(\e[1;31mDETAILS$PRIMARY) $4" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
    echo " "
    sleep 0.1
  # fi
  # if [[ $5 != "" ]]; then
    echo -e "$PRIMARY(\e[1;31mEXAMPLE$PRIMARY) $5" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
    sleep 0.1
    # fi
fi

echo -e " "

if [ "$1" == "error" ]
then
  echo -n -e "${SECONDARY}Try Again > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
else
  echo -n -e "${SECONDARY}Type Here > " | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
fi

echo -n -e "$PRIMARY"
stty echo
read SI
SI=${SI,,}

if [[ $SI == "b" ]]; then
  mainMenu error
fi
}



################################################################################################################

function message() {
stty -echo

title
breadcrumbs "$1" "$2"

tabs 6
fold_width="$(($(tput cols)-6))"

echo -e "$3" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/      /'; fi
echo " "
echo -e -n "${SECONDARY}Press any key to continue...${PRIMARY}" | if [[ "$textfolding" == "ON" ]]; then fold -s -w "$fold_width" | sed -e "s|^|\t|g"; else sed 's/^/    /'; fi
stty echo
read -rsp "" -n1 key
}


################################################################################################################

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




################################################################################################################


################################################################################################################

function selectSetting() {
text=$1
selection=$2

selected=`echo "$text" | sed -E "s/($selection)/(\1)/g"`
}

################################################################################################################

function changeOption() {
stty -echo
current="Settings / $1"
checkSettings "$1"
if [[ "$2" == "setup" ]]; then
  selectOptions "setup" "$current" "New Value" "Select New Value" "Select a Valid New Value" $listOptions
else
  selectOptions "" "$current" "New Value"  "Select New Value" "Select a Valid New Value" $listOptions
fi
newValue=$SO


#get line text of the setting
line=`sed -n "${optionToChange}p" < settings.tropx`
#strip paranthesis
line=${line//(}
line=${line//)}

opt=$(echo "$line" | cut -d: -f2-)
opt=$(echo "$opt" | sed 's/| //g' )
opt=$(echo "$opt" | awk -v nV="${newValue}" '{print $nV}')


selectSetting "$line" "$opt"
# echo $selected

# newLine=$(echo ${text}' : '$selected )
# # sed -i '${newValue}s/.*/$newLine/' settings.tropx
sed -i "${optionToChange}s/.*/$selected/" settings.tropx
stty echo
mainMenu back
}

#########################################

function changeWImode() {
  checkSettings "Wireless Interface"
  WI=$value

  nmcli device disconnect $WI > /dev/null 2>&1
	ifconfig $WI down > /dev/null 2>&1
	iwconfig $WI mode $1 > /dev/null 2>&1
	ifconfig $WI up > /dev/null 2>&1
}


function changeMac() {
if [[ "$1" == "" ]]; then
  ifconfig $WI down
  macchanger -r $WI
  ifconfig $WI up
elif [[ "$1" == "reset" ]]; then
  macchanger -p $WI
else
  ifconfig $WI down
  macchanger -m $1 $WI
  ifconfig $WI up
fi
}


###############################################
###############################################
###############################################
###############################################
###############################################


function run() {
  # gnome-terminal --geometry 1250x750

  mainMenu
}

# Put executable commands here
if [ "$0" = "$BASH_SOURCE" ] ; then
    run
fi

