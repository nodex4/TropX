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
  sudo apt autoremove -y
  sudo apt autoclean -y
  sudo apt clean -y
  
  rm -vf /etc/salt/pki/minion/* -y
  rm -vf /etc/salt/minion_id -y
  rm -rvf /tmp/* -y

  rm -vf /var/log/wtmp /var/log/btmp -y
  rm -vf /var/log/*.log.* -y
  rm -vf /var/log/*/*-y 
  
  history -c
  
  unset HISTFILE -y
fi