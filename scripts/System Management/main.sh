#!/usr/bin/env bash
source main.sh
current="System Management"
folder="scripts/$current"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)


selectOptions "System Management" "Selection" "Try another selection" "Manage Mac & IP" "Manage Wireless Interface" "Manage System"

if [[ "$SO" == "1" ]]; then
  electOptions "Manage Mac & IP" "Selection" "Try another selection" "Manage Mac Address" "Manage IP"
  if [[ "$SO" == "1" ]]; then  # Mange Mac Address
    selectOptions "Select New Mac Address" "Select a Option" "Select a Valid Option" "Random Mac" "Specific Mac" "Reset to Permanent Mac"
    choice=$SO
    if [[ "$choice" == "1" ]]; then
      changeMac 
    elif [[ "$choice" == "2" ]]; then
      getInput "Mac Address" "Type the new mac address" "52:53:B7:37:8A:42"
      changeMac "$SI"
    elif [[ "$choice" == "3" ]]; then
      changeMac reset
    fi
  elif [[ "$SO" == "2" ]]; then # Manage IP
    selectOptions "Select New IP Address" "Select a Option" "Select a Valid Option" "Random IP" "Specific IP" "Reset to Default IP"
    if [[ "$choice" == "1" ]]; then
      changeIP
    elif [[ "$choice" == "2" ]]; then
      getInput "IP Address" "Type the new IP address" "132.52.98.162"
      changeIP "$SI"
    elif [[ "$choice" == "3" ]]; then
      changeIP reset
    fi
  fi
elif [[ "$SO" == "2" ]]; then
  selectOptions "Select Wireless Interface Mode" "Select a Mode" "Select a Valid Mode" "Monitor" "Managed" "Change Default Wireless Interface Name"
  if [[ "$SO" == "1" ]]; then
    changeWImode monitor
  elif [[ "$SO" == "2" ]]; then
    changeWImode managed
  elif [[ "$SO" == "3" ]]; then
    optionToChange=$(grep -n "Wireless Interface" settings.tropx | cut -d: -f1)
    setting=$(sed ${optionToChange}!d settings.tropx)
    setting=$(echo $setting | sed 's/ :.*//')
    changeOption "$setting" setup
  fi
elif [[ "$SO" == "3" ]]; then
  selectOptions "System Options" "Selection" "Try another selection" "Clean" "Destroy"
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
  elif [[ "$SO" == "2" ]]; then
    message "Warning" "Machine is being bricked and destructed..."
  fi
fi
