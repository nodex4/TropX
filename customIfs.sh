#!/bin/bash
# source functions.sh

  # # if [[ $SS == "$scripts" ]]; then
  # # var=$((SS-default_sctipts))
  # # var=$(expr $SS - $default_sctipts)
  # # var=$((SS - default_scripts))
  # # line=$(sed $((SS - default_scripts))!d customScripts.txt)
  # if [[  $(sed $((SS - default_scripts))!d customScripts.txt) == "First" ]]; then
  #   cd custom_scripts
  #   cd ${si}1
  #   bash ${si1}.sh
  #   cd ../
  #   cd ../
  #   mainMenu back
  # fi

function customIFs() {
  :

  if [[ $(sed $((SS - default_scripts))!d customScripts.txt | awk '{print tolower($0)}') == "custom one" ]]; then
    cd custom_scripts
    cd "custom one"
    bash "custom one.sh"
  fi
}
