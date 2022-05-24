#!/usr/bin/env bash

:


textfolding="ON" 

function foldText {
  if [[ "$textfolding" == "ON" ]]; then
    tabs $1
    # fold_width="$(($(tput cols)-$1))"
    fold_width=$((50-$1))
    
    fold -s -w "$fold_width" | sed -e "s|^|\t|g" 

  else
    case $1 in
      2)
        sed 's/^/  /'
        ;;
      4)
        sed 's/^/    /'
        ;;
      6)
        sed 's/^/      /'
        ;;
    esac
  fi
}

text="If you find this paragraph tool useful, please do us a favor and let us know how you're using it. It's greatly beneficial for us to know the different ways this tool is being used so we can improve it with updates. This is especially true since there are times when the generators we create get used in completely unanticipated ways from when we initially created them. If you have the time, please send us a quick note on what you'd like to say..."

echo $text | foldText 2
echo $text | foldText 4
echo $text | foldText 6