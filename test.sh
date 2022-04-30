#!/bin/bash
# source main.sh
source functions.sh
# color switchin using switch / case




# echo -e $"\033[1;36m" cyan
# echo -e $"\033[1;35m" pink
# echo -e $"\033[1;33m" brown
# echo -e $"\033[1;30m" gray

case $(checkSettings "Secondary Color") in
  "RED")ACCENT=$"\033[1;31m";;
  "WHITE")ACCENT=$"\033[1;37m";;
  "BLUE")ACCENT=$"\033[1;34m";;
  "GREEN")ACCENT=$"\033[1;32m";;
  "CYAN")ACCENT=$"\033[1;36m";;
  "PINK")ACCENT=$"\033[1;35m";;
  "YELLOW")ACCENT=$"\033[1;33m";;
  "GRAY")ACCENT=$"\033[1;30m";;
  "GRAY")ACCENT=$"\033[1;30m";;
esac
