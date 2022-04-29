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

tropx="$WHITE▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $RED  ▒██   ██▒
$WHITE▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $RED ▒▒ █ █ ▒░
$WHITE▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $RED ░░  █   ░
$WHITE░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $RED  ░ █ █ ▒ 
$WHITE  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $RED ▒██▒ ▒██▒
$WHITE  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $RED ▒▒ ░ ░▓ ░
$WHITE    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $RED  ░░   ░▒ ░
$WHITE  ░        ░░   ░ ░ ░ ░ ▒  ░░        $RED   ░    ░  
$WHITE            ░         ░ ░            $RED   ░    ░  "




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


echo -e "$WHITE                                     By$RED Troopek  "
echo " "
stty echo
}


function okTitle() {
clear
stty -echo
echo -e "$tropx"
sleep 0.1

echo -e "$WHITE                                     By$RED Troopek  "
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
echo -e "  By$RED Troopek  "| pv -qL 15
echo " "
sleep 0.1
stty echo
}



function selectOptions() {
current=$2

title

echo -e "$BOLD_WHITE  Current: ${BOLD_RED}${current}$BOLD_WHITE"
echo -e "$BOLD_WHITE  ---------------------------------------------"
echo -e "$BOLD_RED  Options: "
echo -e -n "$BOLD_WHITE"
echo " "

#Add custom script option
if [[ $3 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m1$BOLD_WHITE) $3"
fi
if [[ $4 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m2$BOLD_WHITE) $4"
fi
if [[ $5 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m3$BOLD_WHITE) $5"
fi
if [[ $6 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m4$BOLD_WHITE) $6"
fi
if [[ $7 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m5$BOLD_WHITE) $7"
fi
if [[ $8 != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31m6$BOLD_WHITE) $8"
fi





echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$BOLD_RED  Select a Valid Option > "
else
echo -n -e "$BOLD_RED  Select Desired Option > "
fi

echo -n -e "$WHITE"

read SO
SO=${SO,,}

if [[ $SO == "b" ]]; then
  getScript back
fi

selection=("1" "2" "3" "4" "$3" "$4" "$5" "$6" "$7" "$8")
result="$(containsElement "$SO" "${selection[@]}")"

if [[ "$result" != "0" ]]; then 
  until [[ "$result" == "0" ]] #unti the result is not an error
  do
    selectOptions error "$2" "$3" "$4" "$5"
    result="$(containsElement "$SO" "${options[@]}")"
  done
fi

}




###############################################################################

# getInput "" "$current" "text" "do this"
function getInput() {
current=$2
text=$3
description=$4
example=$5

title

echo -e "$BOLD_WHITE  Current: ${BOLD_RED}${current}$BOLD_WHITE"
echo -e "$BOLD_WHITE  ---------------------------------------------"
echo -e "$BOLD_RED  $text"
echo -e -n "$BOLD_WHITE"
echo " "

#Add custom script option
if [[ $description != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31mDETAILS$BOLD_WHITE) $description"
echo " "
fi
if [[ $example != "" ]]; then
echo -e "$BOLD_WHITE    (\e[1;31mEXAMPLE$BOLD_WHITE) $example"
fi



echo -e " "

if [ "$1" == "error" ]
then
echo -n -e "$BOLD_RED  Try Again > "
else
echo -n -e "$BOLD_RED  Type Here > "
fi

echo -n -e "$WHITE"

read SI
SI=${SI,,}

}