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

source customIfs.sh


function checkSettings() {
  dir=`pwd`
  if [[ ${dir##*/} == "TropX" ]]; then
    :
  else
    cd ../
  fi

  if [[ "$2" == "custom" ]]; then
    setting=$(grep "^$1 :" ../settings.tropx | \
      cut "-d:" -f2- | \
        cut "-d " -f2-)
  else
    setting=$(grep "^$1 :" settings.tropx | \
      cut "-d:" -f2- | \
        cut "-d " -f2-)
  fi

  text=$1
  value=$(echo "$setting" | awk -F"[()]" '{print $2}' )
  options=$(echo "$value $setting" | awk '{gsub("[(][^)]*[)]","")}1' )
  listOptions=$(echo "$setting" | sed 's/| //g' )
}
################################################################################################################

function ready() {
#Terminal Colors
if [[ "$1" == "custom" ]]; then
checkSettings "Primary Color" custom
else
checkSettings "Primary Color"
fi

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


if [[ "$1" == "custom" ]]; then
checkSettings "Secondary Color" custom
else
checkSettings "Secondary Color"
fi

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
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$PRIMARY https://github.com/TroopekYT"
exit
}

################################################################################################################

function breadcrumbs() {
  checkSettings "Animations"
  animations=$value

  checkSettings "Breadcrumbs"
  breadcrumbs=$value
  
  if [[ "$3" == "error" ]] || [[ "$3" == "back" ]] || [[ $animations == "OFF" ]] || ([[ $animations == "MINIMAL" ]] && [[ "$3" == "back" ]]) || ([[ $animations == "MINIMAL" ]] && [[ "$3" != "main" ]]); then
    if [[ "$breadcrumbs" == "ON" ]]; then
      echo -e "$PRIMARY  Current: $SECONDARY$1$PRIMARY"
      echo -e "$PRIMARY  ---------------------------------------------"
    else
      :
    fi

    echo -e "$PRIMARY  $2: "
    echo -e -n "$PRIMARY"
    echo " "
  else
    echo -e "$PRIMARY  Current: $SECONDARY$1$PRIMARY"
    sleep 0.1
    echo -e "$PRIMARY  ---------------------------------------------"
    sleep 0.1
    echo -e "$PRIMARY  $2: "
    sleep 0.1
    echo -e -n "$PRIMARY"
    echo " "
  fi
}

################################################################################################################


function title() {

t="$PRIMARY▄▄▄█████▓
▓  ██▒ ▓▒
▒ ▓██░ ▒░
░ ▓██▓ ░ 
  ▒██▒ ░ 
  ▒ ░░   
    ░    
  ░      
         
         "
tr="▄▄▄█████▓ ██▀███  
▓  ██▒ ▓▒▓██ ▒ ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒
░ ▓██▓ ░ ▒██▀▀█▄  
  ▒██▒ ░ ░██▓ ▒██▒
  ▒ ░░   ░ ▒▓ ░▒▓░
    ░      ░▒ ░ ▒░
  ░        ░░   ░ 
            ░     
                  "
tro="▄▄▄█████▓ ██▀███   ▒█████  
▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
    ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
  ░        ░░   ░ ░ ░ ░ ▒  
            ░         ░ ░  
                           "
trop="▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
  ░        ░░   ░ ░ ░ ░ ▒  ░░       
            ░         ░ ░           
                                    "

tropx="$PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
$PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
$PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
$PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
$PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
$PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
$PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
$PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
$PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  "



clear

echo -e "$tropx"


echo -e "$PRIMARY                                     By$SECONDARY Troopek  "
echo " "
}

################################################################################################################


function niceTitle() {

t="$PRIMARY▄▄▄█████▓
▓  ██▒ ▓▒
▒ ▓██░ ▒░
░ ▓██▓ ░ 
  ▒██▒ ░ 
  ▒ ░░   
    ░    
  ░      
         
         "
tr="▄▄▄█████▓ ██▀███  
▓  ██▒ ▓▒▓██ ▒ ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒
░ ▓██▓ ░ ▒██▀▀█▄  
  ▒██▒ ░ ░██▓ ▒██▒
  ▒ ░░   ░ ▒▓ ░▒▓░
    ░      ░▒ ░ ▒░
  ░        ░░   ░ 
            ░     
                  "
tro="▄▄▄█████▓ ██▀███   ▒█████  
▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
    ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
  ░        ░░   ░ ░ ░ ░ ▒  
            ░         ░ ░  
                           "
trop="▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
  ░        ░░   ░ ░ ░ ░ ▒  ░░       
            ░         ░ ░           
                                    "

tropx="$PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
$PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
$PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
$PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
$PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
$PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
$PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
$PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
$PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  "


clear
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


echo -e -n "$PRIMARY                                   "
echo -e "  By$SECONDARY Troopek  "| pv -qL 15
echo " "
sleep 0.1
}

################################################################################################################

function mainMenu() {
stty -echo
current="Main Menu"

checkSettings "Animations"
animations=$value


if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
title
breadcrumbs "$current" "Available Scripts" back
else
niceTitle
breadcrumbs "$current" "Available Scripts" main
fi


if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
echo -e "$PRIMARY    (${SECONDARY}S$PRIMARY) Settings"
echo -e "$PRIMARY    (${SECONDARY}M$PRIMARY) Manage Scripts"
echo -e "$PRIMARY    (${SECONDARY}H$PRIMARY) Help"
echo "    ------------------"
else
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}S$PRIMARY) Settings"
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}M$PRIMARY) Manage Scripts"
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}H$PRIMARY) Help"
sleep 0.1
echo "    ------------------"
fi


export default_scripts=5

if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then

  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "    ("SECONDARY NR PRIMARY") " $0
      }
  ' defaultScripts.txt
  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "    ("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
      }
  ' customScripts.txt
  

else

  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "    ("SECONDARY NR PRIMARY") " $0
      }
  ' defaultScripts.txt
  
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "    ("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
      }
  ' customScripts.txt
  sleep 0.1

fi




echo -e " "

if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
  if [[ "$1" == "error" ]]; then
  echo -n -e "$SECONDARY  Select a Valid Option > "
  else
  echo -n -e "$SECONDARY  Select Desired Option > "
  fi
else
  sleep 0.1
  echo -n -e "$SECONDARY  Select Desired Option > "
fi

echo -n -e "$PRIMARY"

stty echo
read SS
SS=${SS,,}
options=("s" "m" "h" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33")

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

  if [[ $so1 == "1" ]]; then
    #(1) New has been selected
          boiler="#!/bin/bash
source ../functions.sh

current="hey"
ready custom
title
breadcrumbs \""$current"\" \"Options\"
# END OF BOILER (DO NOT REMOVE ABOVE CODE OR MODIFY IT)
      "


    getInput "" "$current" "Please choose a name for your new script: " "Do not incldue a file extension" "Script Name"
    si1=$SI
    #check if filename exists

    until [ ! -f "custom_scripts/${si1}/${si1}.sh" ]
    do
      getInput error "$current" "Options" "Please choose a name for your new script: " "Do not incldue a file extension" "Other Script Name"
      si1=$SI
    done

    echo "$si1" | sed -e "s/\b\(.\)/\u\1/g " >> "customScripts.txt"
    cd custom_scripts
    mkdir "$si1"
    cd $si1
    touch "${si1}.sh"
    cd ../
    selectOptions "" "$current" "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
    insertType=$SO


    if [[ $insertType == "1" ]]; then
      clear
      title
      breadcrumbs "$current" "Options"
      
      echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) press ctrl + d or type \"$SECONDARY~$PRIMARY\" when done"
      echo " "
      echo -e "$SECONDARY  Paste Here >$PRIMARY"
      read -r -d '~' script
      echo "$boiler" >> "custom_scripts/${si1}/${si1}.sh"
      echo "$script" >> "custom_scripts/${si1}/${si1}.sh"

      sed '$s/}$//' < customIfs.sh > customIfs.sh.tmp
      mv customIfs.sh.tmp customIfs.sh
      # sed 'x;${s/}$//;p;x;};1d' 

      echo -e '\n  if [[ $SS == "${default_scripts+1}" ]]; then\n    current="$(sed ${default_scripts+1}!d filename)"' >> customIfs.sh
      echo -e "    bash custom_scripts/${si1}/${si1}.sh" >> customIfs.sh
      echo -e "  fi\n}" >> customIfs.sh

    fi


    if [[ $insertType == "2" ]]; then
      getInput "" "$current" "Read Below" "Please type in the relative or full path of the script: " "Do not incldue a file extension" "root/desktop/scriptText.txt"
    path=$SI
    
    if [[ $path = /* ]]; then
      :
    else
      until [ -f $path ]
      do
        getInput error "$current" "Read Below" "Please type in the relative or full path of the script: " "Do not incldue a file extension" "root/desktop/scriptText.txt"
        path=$SI
      done
    fi

    # echo "$boiler" >> "custom_scripts/${si1}/${si1}.sh"
    script=$(<$path)
    echo "$script"
sleep 10
    echo "$script" >> "custom_scripts/${si1}/${si1}.sh"









    fi
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

customIFs

}


################################################################################################################

function selectOptions() {
stty -echo

checkSettings "Animations"
animations=$value

title
breadcrumbs "$2" "$3"

echo -e "$PRIMARY    (${SECONDARY}B$PRIMARY) Back To Main Menu"

if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  :
else
sleep 0.1
fi


echo "    ------------------"

if [[ $6 == "settings.tropx" ]]; then
  if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          print "    ("SECONDARY NR PRIMARY") " $0
      }
  ' settings.tropx
  else
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "    ("SECONDARY NR PRIMARY") " $0
      }
  ' settings.tropx
  fi
else
  if [[ $6 != "" ]]; then
  echo -e "$PRIMARY    (${SECONDARY}1$PRIMARY) $6"
  i=2
  fi
fi

if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  for arg in "${@:7}"
  do
      echo -e "$PRIMARY    (${SECONDARY}${i}$PRIMARY) ${arg}"
      i=$((i+1))
  done
else
  for arg in "${@:7}"
  do
      echo -e "$PRIMARY    (${SECONDARY}${i}$PRIMARY) ${arg}"
      i=$((i+1))
      sleep 0.1
  done
fi

stringed=$(echo "${@:7}" | sed -E 's/[^[:space:]]+/"&"/g' )


echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$SECONDARY  $5 > "
else
echo -n -e "$SECONDARY  $4 > "
fi

echo -n -e "$PRIMARY"
stty echo
read SO
SO=${SO,,}

if [[ $SO == "b" ]]; then
  mainMenu error
fi
selection=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "$6" $stringed)

if [[ "$(containsElement "$SO" "${selection[@]}")" != "0" ]]; then 
  until [[ "$(containsElement "$SO" "${selection[@]}")" == "0" ]] #unti the result is not an error
  do
    selectOptions "error"  "$2" "$3" "$4" "$5" "$6" "${@:7}" #$stringed
  done
fi
}

################################################################################################################

function getInput() {
stty -echo

title
breadcrumbs "$2" "$3"


if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
  # if [[ $4 != "" ]]; then
    echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) $4"
    echo " "
  # fi
  # if [[ $5 != "" ]]; then
    echo -e "$PRIMARY    (\e[1;31mEXAMPLE$PRIMARY) $5"
  # fi


else
  # if [[ $4 != "" ]]; then
    echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) $4"
    echo " "
    sleep 0.1
  # fi
  # if [[ $5 != "" ]]; then
    echo -e "$PRIMARY    (\e[1;31mEXAMPLE$PRIMARY) $5"
    sleep 0.1
    # fi
fi

echo -e " "

if [ "$1" == "error" ]
then
  echo -n -e "$SECONDARY  Try Again > "
else
  echo -n -e "$SECONDARY  Type Here > "
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
selectOptions "" "$current" "New Value" "Select New Value" "Select a Valid New Value" $listOptions
newValue=$SO


#get line text of the setting
line=`sed -n "${optionToChange}p" < settings.tropx`
#strip paranthesis
line=${line//(}
line=${line//)}

# opt=$line | cut -d ":" -f $newValue
opt=$(echo "$line" | cut -d: -f2-)
opt=$(echo "$opt" | sed 's/| //g' )
# opt=$line | cut -d " " -f $newValue
opt=$(echo "$opt" | awk -v nV="${newValue}" '{print $nV}')


selectSetting "$line" "$opt"
# echo $selected

# newLine=$(echo ${text}' : '$selected )
# # sed -i '${newValue}s/.*/$newLine/' settings.tropx
sed -i "${optionToChange}s/.*/$selected/" settings.tropx
stty echo
mainMenu back
}