#!/bin/bash


function customIFs() {
  if [[ $SS == "${default_scripts+1}" ]]; then
    current="$(sed ${default_scripts+1}!d filename)"
    
  fi
}