#!/usr/bin/env bash
source main.sh

current="System"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    

selectOptions "System Options" "Selection" "Try another selection" "Clean"
if [[ "$SO" == "1" ]]; then
  sudo apt update
  sudo apt upgrade -y
  sudo apt dist upgrade -y 
  sudo apt update -y
  sudo apt autoremove
  sudo apt autoclean
  sudo apt clean
  
  rm -vf /etc/salt/pki/minion/*
  rm -vf /etc/salt/minion_id
  rm -rvf /tmp/*

  rm -vf /var/log/wtmp /var/log/btmp
  rm -vf /var/log/*.log.*
  rm -vf /var/log/*/*
  
  history -c
  
  unset HISTFILE
fi