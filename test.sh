NO_COLOR="\e[0m"
WHITE="\e[0;17m"
BOLD_WHITE="\e[1;37m"
BLACK="\e[0;30m"
BLUE="\e[0;34m"
BOLD_BLUE="\e[1;34m"
GREEN="\e[0;32m"
BOLD_GREEN="\e[1;32m"
CYAN="\e[0;36m"
BOLD_CYAN="\e[1;36m"
RED="\e[0;31m"
BOLD_RED="\e[1;31m"
PURPLE="\e[0;35m"
BOLD_PURPLE="\e[1;35m"
BROWN="\e[0;33m"
BOLD_YELLOW="\e[1;33m"
GRAY="\e[0;37m"
BOLD_GRAY="\e[1;30m"




function printThings() {
for arg
do 
echo "$arg"
done
echo "$@"
# stringed=$(echo "$@" | awk '{printf "\"%s\", ", $0}' )
stringed=$(echo "$@" | sed -r "s/ /\"/g")
echo $stringed
}

printThings 1 2 3 4 5 6 7 8 "nine" "ten" "eleven" "twelve"



