#!/bin/bash


function checkSettings() {
clear
  # str=$(sed '${1}!d' settings.tropx)
 
  # this=$(echo "<${str%%nice *}>" )

  setting=$(grep "^$1 :" settings.tropx | \
    cut "-d:" -f2- | \
      cut "-d " -f2-)

  text=$1
  value=$(echo "$setting" | awk -F"[()]" '{print $2}' )
  options=$(echo "$value $setting" | awk '{gsub("[(][^)]*[)]","")}1' )
  listOptions=$(echo "$setting" | sed 's/| //g' )
  # listOptions2=$(echo "$options2" | sed 's/[^ ][^ ]*/"&"/g' ) 
  
}
################################################################################################################


#Terminal Colors
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

checkSettings "Secondary Color"
accent=$value
case $accent in
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


################################################################################################################


function end() {
clear
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$PRIMARY https://github.com/TroopekYT"
exit
}

################################################################################################################

function breadcrumbs() {
  echo -e "$PRIMARY  Current: $SECONDARY$1$PRIMARY"
  echo -e "$PRIMARY  ---------------------------------------------"
  echo -e "$PRIMARY  $2: "
  echo -e -n "$PRIMARY"
  echo " "
}







################################################################################################################


function title() {
clear

echo -e "$tropx"


echo -e "$PRIMARY                                     By$SECONDARY Troopek  "
echo " "
}

################################################################################################################


function okTitle() {
clear
echo -e "$tropx"
sleep 0.1

echo -e "$PRIMARY                                     By$SECONDARY Troopek  "
echo " "

}

################################################################################################################


function niceTitle() {
clear


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
if [[ "$1" == "error" ]] || [[ "$1" == "back" ]]; then
okTitle
else
niceTitle
fi

current="Main Menu"
breadcrumbs "$current" "Available Scripts"
sleep 0.1


#Some Options
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}S$PRIMARY) Settings"
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}M$PRIMARY) Manage Scripts"
sleep 0.1
echo -e "$PRIMARY    (${SECONDARY}H$PRIMARY) Help"
sleep 0.1
echo "    ------------------"


export default_scripts=5

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




echo -e " "

if [ "$1" == "error" ]
then
sleep 0.1
echo -n -e "$SECONDARY  Select a Valid Option > "
else
sleep 0.1
echo -n -e "$SECONDARY  Select Desired Script > "
fi

echo -n -e "$PRIMARY"

stty echo
read SS
SS=${SS,,}
options=("s" "m" "h")

if [[ $(containsElement "$SS" "${options[@]}") != "0" ]]; then 
  until [[ $(containsElement "$SS" "${options[@]}") == "0" ]] #unti the result is not an error
  do
    mainMenu error
    result="$(containsElement "$SS" "${options[@]}")"
  done
fi
clear
}


################################################################################################################

function selectOptions() {
stty -echo

title
breadcrumbs "$2" "$3"

echo -e "$PRIMARY    (${SECONDARY}B$PRIMARY) Back To Main Menu"
sleep 0.1
echo "    ------------------"

if [[ $6 == "settings.tropx" ]]; then
  awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
      {
          system("sleep 0.1")
          print "    ("SECONDARY NR PRIMARY") " $0
      }
  ' settings.tropx
#   i=$(echo "${@:7}" | wc -w)

# echo "${@:7}" | wc -w

else
  if [[ $6 != "" ]]; then
  echo -e "$PRIMARY    (${SECONDARY}1$PRIMARY) $6"
  i=2
  fi
fi


for arg in "${@:7}"
do
    echo -e "$PRIMARY    (${SECONDARY}${i}$PRIMARY) ${arg}"
    i=$((i+1))
done

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

selection=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "$6" $stringed)

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
current=$2
text=$3
description=$4
example=$5

title

echo -e "$PRIMARY  Current: ${SECONDARY}${current}$PRIMARY"
echo -e "$PRIMARY  ---------------------------------------------"
echo -e "$PRIMARY  $text: "
echo -e -n "$PRIMARY"
echo " "

#Add custom script option
if [[ $description != "" ]]; then
echo -e "$PRIMARY    (\e[1;31mDETAILS$PRIMARY) $description"
echo " "
fi
if [[ $example != "" ]]; then
echo -e "$PRIMARY    (\e[1;31mEXAMPLE$PRIMARY) $example"
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