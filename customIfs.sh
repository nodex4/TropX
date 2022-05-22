#!/usr/bin/env bash

function customIFs() {
  :



if [[ $(sed $((SS - default_scripts))!d script_names/customScripts.txt) == "Test" ]]; then
  bash "custom_scripts/Test/main.sh"
fi


if [[ $(sed $((SS - default_scripts))!d script_names/customScripts.txt) == "Test12" ]]; then
  bash "custom_scripts/Test12/main.sh"
fi
}
