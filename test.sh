#!/bin/bash


:

# { echo "firs"
# echo -e "\tfoo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo foo"
# } | fmt

#######################################

#make this lowercase
# $($(sed $((SS - default_scripts))!d customScripts.txt) | awk '{print tolower($0)}')

############################################


# tabs 4
# fold_width="$(($(tput cols)-4))"
# echo "A very long line that I want to fold on the word boundary and indent as well" | fold -s -w "$fold_width"  | sed -e "s|^|\t|g"