#Terminal Colors
WHITE=$"\033[1;37m"

COLOR=$"\033[1;31m"



t="▄▄▄█████▓
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

tropx="$WHITE▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $COLOR  ▒██   ██▒
$WHITE▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $COLOR ▒▒ █ █ ▒░
$WHITE▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $COLOR ░░  █   ░
$WHITE░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $COLOR  ░ █ █ ▒ 
$WHITE  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $COLOR ▒██▒ ▒██▒
$WHITE  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $COLOR ▒▒ ░ ░▓ ░
$WHITE    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $COLOR  ░░   ░▒ ░
$WHITE  ░        ░░   ░ ░ ░ ░ ▒  ░░        $COLOR   ░    ░  
$WHITE            ░         ░ ░            $COLOR   ░    ░  "




function end() {
clear
echo -e "$BOLD_CYAN ★ $BOLD_BLUE Have a nice day! $BOLD_CYAN★"
echo -e "$BOLD_BLUE My GitHub:$WHITE https://github.com/TroopekYT"
exit
}



function title() {
clear
stty -echo

echo -e "$tropx"


echo -e "$WHITE                                     By$COLOR Troopek  "
echo " "
stty echo
}


function okTitle() {
clear
stty -echo
echo -e "$tropx"
sleep 0.1

echo -e "$WHITE                                     By$COLOR Troopek  "
echo " "
sleep 0.1
stty echo
}

function niceTitle() {
clear
stty -echo


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


echo -e -n "$WHITE                                   "
echo -e "  By$COLOR Troopek  "| pv -qL 15
echo " "
sleep 0.1
stty echo
}

################################################################################################################

function getScript() {
niceTitle
stty -echo

sleep 0.1
echo -e "$COLOR  Available Scripts: "
echo -e -n "$WHITE"
echo " "

#Some Options
sleep 0.1
echo -e "$WHITE    (\e[1;31mS$WHITE) Settings"
sleep 0.1
echo -e "$WHITE    (\e[1;31mM$WHITE) Manage Scripts"
sleep 0.1
echo -e "$WHITE    (\e[1;31mH$WHITE) Help"
sleep 0.1
echo "    ------------------"


export default_scripts=5

awk '{system("sleep 0.1");print "    (\033[1;31m" NR "\033[1;37m) " $0 }' < defaultScripts.txt

awk '{system("sleep 0.1");print "    (\033[1;31m" NR+ENVIRON["default_scripts"] "\033[1;37m) " $0 }' < customScripts.txt





echo -e " "

if [ "$1" == "error" ]
then
sleep 0.1
echo -n -e "$COLOR  Select a Valid Option > "
else
sleep 0.1
echo -n -e "$COLOR  Select Desired Script > "
fi

echo -n -e "$WHITE"

stty echo
read SS
SS=${SS,,}

manageScripts=("add" "custom" "custom add" "custom script" "add custom" "add script" "m")
settingsOptions=("s" "set" "options" "settings" "add custom" "add script" "custom script")

options=("${manageScripts[@]}" "${settingsOptions[@]}")


result="$(containsElement "$SS" "${options[@]}")"

if [[ "$result" != "0" ]]; then 
  until [[ "$result" == "0" ]] #unti the result is not an error
  do
    okTitle
    getScript error
    result="$(containsElement "$SS" "${options[@]}")"
  done
fi
stty echo
}


################################################################################################################

function selectOptions() {
current=$2
section=$3
typehere=$4
typehereagain=$5

title

echo -e "$WHITE  Current: ${COLOR}${current}$WHITE"
echo -e "$WHITE  ---------------------------------------------"
echo -e "$WHITE  ${section}: "
echo -e -n "$WHITE"
echo " "
#Add custom script option
if [[ $6 == "settings.tropx" ]]; then
awk -v COLOR="$COLOR" -v WHITE="$WHITE" '
    {
        system("sleep 0.1")
        print "    ("COLOR NR WHITE") " $0
    }
' settings.tropx


for arg
do

done

else
  if [[ $6 != "" ]]; then
  echo -e "$WHITE    (\e[1;31m1$WHITE) $6"
  fi
fi



if [[ $7 != "" ]]; then
echo -e "$WHITE    (\e[1;31m2$WHITE) $7"
fi

if [[ $8 != "" ]]; then
echo -e "$WHITE    (\e[1;31m3$WHITE) $8"
fi

if [[ $9 != "" ]]; then
echo -e "$WHITE    (\e[1;31m4$WHITE) $9"
fi

if [[ $X != "" ]]; then
echo -e "$WHITE    (\e[1;31m5$WHITE) $X"
fi

# if [[ $X1 != "" ]]; then
# echo -e "$WHITE    (\e[1;31m6$WHITE) $X1"
# fi





echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$COLOR  $typehereagain > "
else
echo -n -e "$COLOR  $typehere > "
fi

echo -n -e "$WHITE"

read SO
SO=${SO,,}

if [[ $SO == "b" ]]; then
  getScript
fi

selection=("1" "2" "3" "4" "5" "6" "$6" "$7" "$8" "$9" "$X")
result="$(containsElement "$SO" "${selection[@]}")"

if [[ "$result" != "0" ]]; then 
  until [[ "$result" == "0" ]] #unti the result is not an error
  do
    selectOptions error  "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
    result="$(containsElement "$SO" "${selection[@]}")"
  done
fi

}




################################################################################################################

# getInput "" "$current" "text" "do this"
function getInput() {
current=$2
text=$3
description=$4
example=$5

title

echo -e "$WHITE  Current: ${COLOR}${current}$WHITE"
echo -e "$WHITE  ---------------------------------------------"
echo -e "$WHITE  $text: "
echo -e -n "$WHITE"
echo " "

#Add custom script option
if [[ $description != "" ]]; then
echo -e "$WHITE    (\e[1;31mDETAILS$WHITE) $description"
echo " "
fi
if [[ $example != "" ]]; then
echo -e "$WHITE    (\e[1;31mEXAMPLE$WHITE) $example"
fi



echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$COLOR  Try Again > "
else
echo -n -e "$COLOR  Type Here > "
fi

echo -n -e "$WHITE"

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

function selectSetting() {
text=$1
selection=$2

selected=`echo "$text" | sed -E "s/($selection)/(\1)/g"`
}

################################################################################################################

function changeOption() {
option=$1

checkSettings "$1"
current="Settings / $1"
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

}