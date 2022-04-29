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


function title() {
clear
echo -e "$WHITE ▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $RED  ▒██   ██▒
$WHITE▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $RED ▒▒ █ █ ▒░
$WHITE▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $RED ░░  █   ░
$WHITE░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $RED  ░ █ █ ▒ 
$WHITE  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $RED ▒██▒ ▒██▒
$WHITE  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $RED ▒▒ ░ ░▓ ░
$WHITE    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $RED  ░░   ░▒ ░
$WHITE  ░        ░░   ░ ░ ░ ░ ▒  ░░        $RED   ░    ░  
$WHITE            ░         ░ ░            $RED   ░    ░  "
                                                
                                 
echo -e "$WHITE                                   By$RED Troopek  "
echo " "
}



function selectOptions() {
current=$2

title

echo -e "$BOLD_WHITE  You have selected: ${BOLD_RED}${current}$BOLD_WHITE"
echo " "

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
echo -n -e "$BOLD_RED  Select a Valid option> "
else
echo -n -e "$BOLD_RED  Select Desired Option > "
fi

echo -n -e "$WHITE"

read SO
SO=${SO,,}

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