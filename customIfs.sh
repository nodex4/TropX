#!/bin/bash

function customIFs() {
  :



  if [[ $(sed $((SS - default_scripts))!d customScripts.txt) == "Test" ]]; then
    python3 "custom_scripts/Test/main.py"
  fi
}
