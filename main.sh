#!/usr/bin/env bash

#  ____        _______                         _     
# |  _ \      |__   __|                       | |    
# | |_) |_   _   | |_ __ ___   ___  _ __   ___| | __ 
# |  _ <| | | |  | | '__/ _ \ / _ \| '_ \ / _ \ |/ / 
# | |_) | |_| |  | | | | (_) | (_) | |_) |  __/   <  
# |____/ \__, |  |_|_|  \___/ \___/| .__/ \___|_|\_\ 
#         __/ |                    | |               
#        |___/                     |_|
# 
# Github: https://github.com/troopek/



function checkSettings() {
  setting=$(grep "^$1 :" settings.tropx | \
    cut "-d:" -f2- | \
      cut "-d " -f2-)

  text=$1
  value=$(echo "$setting" | awk -F"[()]" '{print $2}' )
  options=$(echo "$value $setting" | awk '{gsub("[(][^)]*[)]","")}1' )
  listOptions=$(echo "${setting//| /}")
}
################################################################################################################

function ready() {
  checkSettings "Wireless Interface"
  WI=$value

  checkSettings "Primary Color"
  
  primary=$value
  case $primary in
    "WHITE")PRIMARY=$"\033[1;37m";;
    "RED")PRIMARY=$"\033[1;31m";;
    "BLUE")PRIMARY=$"\033[1;34m";;
    "GREEN")PRIMARY=$"\033[1;32m";;
    "CYAN")PRIMARY=$"\033[1;36m";;
    "PINK")PRIMARY=$"\033[1;35m";;
    "YELLOW")PRIMARY=$"\033[1;33m";;
    "GRAY")PRIMARY=$"\033[1;30m";;
    *)PRIMARY=$"\033[1;37m";;
  esac
  
  
  # if [[ "$1" == "custom" ]]; then
  # checkSettings "Secondary Color" custom
  # else
  # checkSettings "Secondary Color"
  # fi
  
  checkSettings "Secondary Color"
  
  secondary=$value
  case $secondary in
    "RED")SECONDARY=$"\033[1;31m";;
    "WHITE")SECONDARY=$"\033[1;37m";;
    "BLUE")SECONDARY=$"\033[1;34m";;
    "GREEN")SECONDARY=$"\033[1;32m";;
    "CYAN")SECONDARY=$"\033[1;36m";;
    "PINK")SECONDARY=$"\033[1;35m";;
    "YELLOW")SECONDARY=$"\033[1;33m";;
    "GRAY")SECONDARY=$"\033[1;30m";;
    *)SECONDARY=$"\033[1;37m";;
  esac
}



################################################################################################################


function end() {
  if [[ $inScript == true ]]; then
    mainMenu
  else
  
    clear
    stty -echo
  
    checkSettings "Animations"
    animations=$value
    
    # Set WI to managed and reset mac
    changeWImode managed
    changeMac reset
    clear
    if [[ "$animations" == "ON" ]]; then
      echo " "
      sleep 01
      echo -e "  Thanks for using"
      echo -e "  ${SECONDARY}TropX${PRIMARY}" | pv -qL 15
      echo -e "  ┌────────────────────────────────────────────
  └─ ${SECONDARY}github.com/troopek/TropX"
    sleep 01
      echo " "
    else
      echo " "
      
      echo -e "  Thanks for using ${SECONDARY}TropX${PRIMARY}
  ┌────────────────────────────────────────────
  └─ ${SECONDARY}github.com/troopek/TropX"
      echo " "
    fi
  
    stty echo
    exit
  fi
}

################################################################################################################

function breadcrumbs() {
  checkSettings "Animations"
  animations=$value

  checkSettings "Breadcrumbs"
  breadcrumbs=$value
  if [[ "$1" != '' ]]; then
    if [[ "$2" == "error" ]] || [[ "$2" == "back" ]] || [[ $animations == "OFF" ]] || ([[ $animations == "MINIMAL" ]] && [[ "$2" == "back" ]]) || ([[ $animations == "MINIMAL" ]] && [[ "$2" != "main" ]]); then
      if [[ "$breadcrumbs" == "ON" ]]; then
        echo -e "${PRIMARY}Current: $SECONDARY$current$PRIMARY" | foldText 4
  
        COLUMNS="$(tput cols)"
        if [[ $COLUMNS -lt 53 ]]; then
          echo -e "$PRIMARY    ----------------------"
        else
          echo -e "$PRIMARY    ---------------------------------------------"
        fi
        
      else
        :
      fi
  
      echo -e "$PRIMARY$1: " | foldText 4
      echo " "
    else
      echo -e "${PRIMARY}Current: $SECONDARY$current$PRIMARY" | foldText 4
      sleep 0.1
      echo -e "$PRIMARY    ---------------------------------------------"
      sleep 0.1
      echo -e "$PRIMARY$1: " | foldText 4
      sleep 0.1
      echo " "
    fi
  fi
}

################################################################################################################


function title() {
  checkSettings "Header Logo"; HL=$value
  if [[ $HL == "SHOW" ]]; then
    
    t="
      $PRIMARY▄▄▄█████▓
      ▓  ██▒ ▓▒
      ▒ ▓██░ ▒░
      ░ ▓██▓ ░ 
        ▒██▒ ░ 
        ▒ ░░   
          ░    
        ░      
             
             "
    tr="
      ▄▄▄█████▓ ██▀███  
      ▓  ██▒ ▓▒▓██ ▒ ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒
      ░ ▓██▓ ░ ▒██▀▀█▄  
        ▒██▒ ░ ░██▓ ▒██▒
        ▒ ░░   ░ ▒▓ ░▒▓░
          ░      ░▒ ░ ▒░
        ░        ░░   ░ 
                ░     
                      "
    tro="
      ▄▄▄█████▓ ██▀███   ▒█████  
      ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
      ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
        ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
        ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
          ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
        ░        ░░   ░ ░ ░ ░ ▒  
                  ░         ░ ░  
                               "
    trop="
      ▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
      ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
      ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
        ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
        ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
          ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
        ░        ░░   ░ ░ ░ ░ ▒  ░░       
                  ░         ░ ░           
                                        "
    
    tropx="
      $PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
      $PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
      $PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
      $PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
      $PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
      $PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
      $PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
      $PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
      $PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  
                                                                        "
    
    minitropx="
      $PRIMARY▄▄▄█████▓   $SECONDARY▒██   ██▒
      $PRIMARY▓  ██▒ ▓▒   $SECONDARY▒▒ █ █ ▒░
      $PRIMARY▒ ▓██░ ▒░   $SECONDARY░░  █   ░
      $PRIMARY░ ▓██▓ ░    $SECONDARY ░ █ █ ▒ 
      $PRIMARY  ▒██▒ ░    $SECONDARY▒██▒ ▒██▒
      $PRIMARY  ▒ ░░     $SECONDARY ▒▒ ░ ░▓ ░
      $PRIMARY    ░      $SECONDARY ░░   ░▒ ░
      $PRIMARY  ░        $SECONDARY  ░    ░  
      $PRIMARY           $SECONDARY  ░    ░  
                         "
    
    clear
    
    COLUMNS="$(tput cols)"
    if [[ $COLUMNS -lt 53 ]]; then
      echo -e "$minitropx"
      echo -e -n "$PRIMARY"
    else
      echo -e "$tropx"
      echo -e -n "$PRIMARY                                       "
      echo -e "By$SECONDARY Troopek  "
      echo " "
    fi
    
  else
    clear
    echo ""
  fi
}

################################################################################################################


function niceTitle() {
  checkSettings "Header Logo"; HL=$value
  if [[ $HL == "SHOW" ]]; then
  
    t="
      $PRIMARY▄▄▄█████▓
      ▓  ██▒ ▓▒
      ▒ ▓██░ ▒░
      ░ ▓██▓ ░ 
        ▒██▒ ░ 
        ▒ ░░   
          ░    
        ░      
             
             "
    tr="
      ▄▄▄█████▓ ██▀███  
      ▓  ██▒ ▓▒▓██ ▒ ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒
      ░ ▓██▓ ░ ▒██▀▀█▄  
        ▒██▒ ░ ░██▓ ▒██▒
        ▒ ░░   ░ ▒▓ ░▒▓░
          ░      ░▒ ░ ▒░
        ░        ░░   ░ 
                ░     
                      "
    tro="
      ▄▄▄█████▓ ██▀███   ▒█████  
      ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒
      ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░
        ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░
        ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ 
          ░      ░▒ ░ ▒░  ░ ▒ ▒░ 
        ░        ░░   ░ ░ ░ ░ ▒  
                  ░         ░ ░  
                               "
    trop="
      ▄▄▄█████▓ ██▀███   ▒█████   ██▓███  
      ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒
      ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒
      ░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒
        ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░
        ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░
          ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░     
        ░        ░░   ░ ░ ░ ░ ▒  ░░       
                  ░         ░ ░           
                                        "
    
    tropx="
      $PRIMARY▄▄▄█████▓ ██▀███   ▒█████   ██▓███   $SECONDARY  ▒██   ██▒
      $PRIMARY▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▓██░  ██▒  $SECONDARY ▒▒ █ █ ▒░
      $PRIMARY▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▓██░ ██▓▒  $SECONDARY ░░  █   ░
      $PRIMARY░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒██▄█▓▒ ▒  $SECONDARY  ░ █ █ ▒ 
      $PRIMARY  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒██▒ ░  ░  $SECONDARY ▒██▒ ▒██▒
      $PRIMARY  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒▓▒░ ░  ░  $SECONDARY ▒▒ ░ ░▓ ░
      $PRIMARY    ░      ░▒ ░ ▒░  ░ ▒ ▒░ ░▒ ░      $SECONDARY  ░░   ░▒ ░
      $PRIMARY  ░        ░░   ░ ░ ░ ░ ▒  ░░        $SECONDARY   ░    ░  
      $PRIMARY            ░         ░ ░            $SECONDARY   ░    ░  
                                                                        "
    
    
    minitropx="
      $PRIMARY▄▄▄█████▓   $SECONDARY▒██   ██▒
      $PRIMARY▓  ██▒ ▓▒   $SECONDARY▒▒ █ █ ▒░
      $PRIMARY▒ ▓██░ ▒░   $SECONDARY░░  █   ░
      $PRIMARY░ ▓██▓ ░    $SECONDARY ░ █ █ ▒ 
      $PRIMARY  ▒██▒ ░    $SECONDARY▒██▒ ▒██▒
      $PRIMARY  ▒ ░░     $SECONDARY ▒▒ ░ ░▓ ░
      $PRIMARY    ░      $SECONDARY ░░   ░▒ ░
      $PRIMARY  ░        $SECONDARY  ░    ░  
      $PRIMARY           $SECONDARY  ░    ░  
                         "
    
    
    
    clear
    
    
    
    COLUMNS="$(tput cols)"
    if [[ $COLUMNS -lt 53 ]]; then
      sleep 1
      echo -e "$minitropx"
      sleep 0.3
      echo -e -n "$PRIMARY"
      sleep 0.1
    else
      sleep 1
      
      echo -e "$t"
      sleep 0.15
      clear
      echo -e "$tr"
      sleep 0.15
      clear
      echo -e "$tro"
      sleep 0.15
      clear
      echo -e "$trop"
      
      sleep 0.3
      clear
      echo -e "$tropx"
      
      echo -e -n "$PRIMARY                                     "
      echo -e "By$SECONDARY Troopek  " | pv -qL 15
      echo " "
      sleep 0.1
    fi
  
  
  else
    clear
    echo ""
  fi
}

################################################################################################################

function mainMenu() {
  inScript=false
  stty -echo
  checkSettings "Wireless Interface"; WI=$value
  checkSettings "Text Folding"; textfolding=$value;
  checkSettings "Animations"; animations=$value
  current="Main Menu"
  
  
  
  
  git remote update
  output=$(git status -uno)
  if [[ $output != *"pull"* ]]; then
    :
  else
    selectOptions "New version available" "Select Option" "Select valid Option" "Yes, Update TropX" "No, Don't Update TropX"
  git pull
  fi
  
  if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
    title
    breadcrumbs "Available Scripts and Tools" back
  else
    niceTitle
    breadcrumbs "Available Scripts and Tools" main
  fi
  
  
  if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
  
    echo -e "$PRIMARY(${SECONDARY}S$PRIMARY) Settings" | foldText 6
    echo -e "$PRIMARY(${SECONDARY}M$PRIMARY) Manage Scripts" | foldText 6
    echo -e "$PRIMARY(${SECONDARY}H$PRIMARY) Help" | foldText 6
    echo -e "$PRIMARY(${SECONDARY}N$PRIMARY) New Instance" | foldText 6
    echo "      ------------------------"
  
  else
  
    sleep 0.1
    echo -e "$PRIMARY(${SECONDARY}S$PRIMARY) Settings" | foldText 6
    sleep 0.1
    echo -e "$PRIMARY(${SECONDARY}M$PRIMARY) Manage Scripts" | foldText 6
    sleep 0.1
    echo -e "$PRIMARY(${SECONDARY}H$PRIMARY) Help" | foldText 6
    sleep 0.1
    echo -e "$PRIMARY(${SECONDARY}N$PRIMARY) New Instance" | foldText 6
    sleep 0.1
    echo "      ------------------------"
  
  
  fi
  
  
  
  
  
  default_scripts=$(wc -l < script_names/defaultScripts.txt)
  
  custom_scripts=$(wc -l < script_names/customScripts.txt)
  scripts=$(expr $default_scripts + $custom_scripts)
  
  # This is commented as both scriptName files have a blank line at the bottom now
  # default_scripts=$((default_scripts+1))
  export default_scripts
  
  if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
  
    
    awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
        {
            print "("SECONDARY NR PRIMARY") " $0
        }
    ' script_names/defaultScripts.txt | foldText 6
    
    awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
        {
            print "("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
        }
    ' script_names/customScripts.txt | foldText 6
    
  
  else
  
    
    awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
        {
            system("sleep 0.1")
            print "("SECONDARY NR PRIMARY") " $0
        }
    ' script_names/defaultScripts.txt | foldText 6
    
    awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
        {
            system("sleep 0.1")
            print "("SECONDARY NR+ENVIRON["default_scripts"] PRIMARY") " $0
        }
    ' script_names/customScripts.txt | foldText 6
    sleep 0.1
  
  fi
  
  
  
  
  echo -e " "
  
  if [[ "$1" == "error" ]] || [[ "$1" == "back" ]] || [[ $animations == "OFF" ]]; then
    if [[ "$1" == "error" ]]; then
    echo -n -e "${SECONDARY}Select a Valid Option > " | foldText 4
    else
    echo -n -e "${SECONDARY}Select Desired Option > " | foldText 4
    fi
  else
    sleep 0.1
    echo -n -e "${SECONDARY}Select Desired Option > " | foldText 4
  fi
  
  
  echo -n -e "$PRIMARY"
  
  stty echo
  read SS
  SS=${SS,,}
  
  
  scriptCount=$scripts
  numberOptions=$(echo $(seq $scriptCount))
  
  options=("s" "m" "h" "u" $numberOptions)
  
  if [[ $(containsElement "$SS" "${options[@]}") != "0" ]]; then 
    until [[ "$result" == "0" ]] #unti the result is not an error
    do
      mainMenu error
      result="$(containsElement "$SS" "${options[@]}")"
    done
  fi
  clear
  
  
  if [[ $SS == "m" ]]; then
    current="Manage Scripts"
  
    selectOptions "Options" "Select Desired Option" "Select a Valid Option" "New Script" "Modify Existing" "Rename Script" "Delete Script"
    so1=$SO
  
    if [[ $so1 == "1" ]]; then #NEW
      checkSettings "Developer Mode"; devmode=$value
      if [[ $devmode == "ON" ]]; then
        selectOptions "Add as Custom or Default [DEV OPTION]" "Select Script Type" "Select Valid Script Type" "Custom" "Default"
        scriptType="$SO"
        if [[ $scriptType == "2" ]]; then
  
          
      
      
          getInput "Please choose a name for your new default script" "do not include a file extension" "Script Name"
          si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
      
          until [ ! -f "scripts/${si1}/main.sh" ]
          do
            getInput error "Options" "Please choose a name a diffrent name for your new default script" "This will be the one which will be displayed in the Main Menu and in other places" "Custom Script Name"
            si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
          done
      
        selectOptions "Script/ Tool Language" "Select Script Language" "Select Valid Script Language" "Bash" "Python" "Import Repo from GitHub"
            language="$SO"
      
      case "$language" in
        "1")  #bash
          boiler='#!/usr/bin/env bash
  source main.sh
  folder="custom_scripts/$current"
  current="'"$si1"'"
  ready
  # END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
      '
      
          ;;
        "2") #python
            boiler=''
          ;;
        "3") #github
          getInput "Github Link" "Copy the link of the repo from the browser" "https://github.com/troopek/TropX"
          link="$SI"
      
          # selectOptions "Main Language of this Script/ Tool" "Main Language" "Select Valid Script Language" "Bash" "Python" 
          # case "$SO" in
          #   "1") #bash
          #     githubLanguage="bash"
          #     ;;
          #   "2") #python
          #     githubLanguage="python3"
          #     ;;
          # esac
          getInput "Main File Name" "What is the main file name that has to be run for the tool/ script to start (Yes, include a file extension)" "run_app.py"
          mainfile=$SI
          ;;
      
      esac
      
          if [[ "$language" != "3" ]]; then
            selectOptions "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
            insertType=$SO
            
        
            if [[ $insertType == "1" ]]; then #paste
              clear
              title
              breadcrumbs "Options"
              
              echo -e "$PRIMARY(${SECONDARY}DETAILS$PRIMARY) Type the \"$SECONDARY~$PRIMARY\" (tilda) character when done" | foldText 4
              echo " "
              echo -e "$SECONDARY  Paste Here > $PRIMARY" | foldText 4
              read -r -d '~' script
            fi
        
            if [[ $insertType == "2" ]]; then #path
              getInput "Read Below" "Please type in the relative or full path of the script: " "do not include a file extension" "/root/desktop/script_text.txt"
            path=$( echo $SI | sed 's/ //g')
        
              until [ -f $path ]
              do
                getInput error "Read Below" "Please type in the relative or full path of the script: " "do not include a file extension" "/root/desktop/script_text.txt"
                path=$SI
              done
              script=$(<$path)  
            fi
          fi
      
      
      
      
          cd scripts
          mkdir "$si1"
          cd "$si1"
      
          case "$language" in
            "1") #bash
              touch main.sh
              ;;
            "2") #python
              touch main.py
              ;;
            "3") #github
              git clone "$link" .
              ;;
      
          esac
      
          cd ../../
      
          case "$language" in
            "1") #bash
              echo "$boiler" >> "scripts/${si1}/main.sh"
              echo "$script" >> "scripts/${si1}/main.sh"
              ;;
            "2") #python
              echo "$boiler" >> "scripts/${si1}/main.py"
              echo "$script" >> "scripts/${si1}/main.py"
              ;;
            "3") #github
              :
              ;;
      
          esac
    
      
          echo "$si1" | sed -e "s/\b\(.\)/\u\1/g " >> "script_names/defaultScripts.txt"
        
          Message="To add files or edit this script, go to scripts/"$scriptToEdit" and commit your changes there!"
          message "Message" "$Message"
          reboot
  
  
        fi
      fi
        
    
      getInput "Please choose a name for your new script" "do not include a file extension" "Script Name"
      si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
  
      until [ ! -f "custom_scripts/${si1}/main.sh" ] && [ ! -f "scripts/${si1}/main.sh" ]
      do
        getInput error "Options" "Please choose a name for your new script" "This will be the one which will be displayed in the Main Menu and in other places" "Custom Script Name"
        si1=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
      done
  
    selectOptions "Script/ Tool Language" "Select Script Language" "Select Valid Script Language" "Bash" "Python" "Import Repo from GitHub"
        language="$SO"
  
  case "$language" in
    "1")  #bash
      boiler='#!/usr/bin/env bash
  source main.sh
  folder="scripts/$current"
  current="'"$si1"'"
  ready
  # END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
  '
  
      ;;
    "2") #python
        boiler=''
      ;;
    "3") #github
      getInput "Github Link" "Copy the link of the repo from the browser" "https://github.com/troopek/TropX"
      link="$SI"
  
      # selectOptions "Main Language of this Script/ Tool" "Main Language" "Select Valid Script Language" "Bash" "Python" 
      # case "$SO" in
      #   "1") #bash
      #     githubLanguage="bash"
      #     ;;
      #   "2") #python
      #     githubLanguage="python3"
      #     ;;
      # esac
      getInput "Main File Name" "What is the main file name that has to be run for the tool/ script to start (Yes, include a file extension)" "run_TropX.py"
      mainfile=$SI
      ;;
  
  esac
  
      if [[ "$language" != "3" ]]; then
        selectOptions "Options" "Select Desired Option" "Select a Valid Option" "Paste script into terminal" "Paste path to script into terminal"
        insertType=$SO
        
    
        if [[ $insertType == "1" ]]; then #paste
          clear
          title
          breadcrumbs "Options"
          
          echo -e "$PRIMARY(${SECONDARY}DETAILS$PRIMARY) Type the \"$SECONDARY~$PRIMARY\" (tilda) character when done" | foldText 4
          echo " "
          echo -e "$SECONDARY  Paste Here > $PRIMARY" | foldText 4
          read -r -d '~' script
        fi
    
        if [[ $insertType == "2" ]]; then #path
          getInput "Read Below" "Please type in the relative or full path of the script: " "do not include a file extension" "/root/desktop/script_text.txt"
        path=$( echo $SI | sed 's/ //g')
    
          until [ -f $path ]
          do
            getInput error "Read Below" "Please type in the relative or full path of the script: " "do not include a file extension" "/root/desktop/script_text.txt"
            path=$SI
          done
          script=$(<$path)  
        fi
      fi
  
  
  
  
      cd custom_scripts
      mkdir "$si1"
      cd "$si1"
  
      case "$language" in
        "1") #bash
          touch main.sh
          ;;
        "2") #python
          touch main.py
          ;;
        "3") #github
          git clone "$link" .
          ;;
  
      esac
  
      cd ../../
  
      case "$language" in
        "1") #bash
          echo "$boiler" >> "custom_scripts/${si1}/main.sh"
          echo "$script" >> "custom_scripts/${si1}/main.sh"
          ;;
        "2") #python
          echo "$boiler" >> "custom_scripts/${si1}/main.py"
          echo "$script" >> "custom_scripts/${si1}/main.py"
          ;;
        "3") #github
          :
          ;;
  
      esac
  
  
      echo "$si1" | sed -e "s/\b\(.\)/\u\1/g " >> "script_names/customScripts.txt"
    
      Message="To edit the selected script or add additional files in it's file tree, please navigate to custom_scripts/"$scriptToEdit" and commit your changes there!"
      message "Message" "$Message"
      reboot
  
    elif [[ $so1 == "2" ]]; then
      customScriptNames=$(<script_names/customScripts.txt)
  
      SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
      IFS=$'\n'      # Change IFS to newline char
      customScriptNames=($customScriptNames) # split the `customScriptNames` string into an array by the same name
      IFS=$SAVEIFS   # Restore original IFS
  
  
      selectOptions "Script to Edit" "Select Script to Edit" "Select a Valid Script"  "${customScriptNames[@]}"
  
      scriptToEdit=$(sed "${SO}!d" script_names/customScripts.txt)
  
      Message="To edit the selected script or add additional files in it's file tree, please navigate to custom_scripts/"$scriptToEdit" and commit your changes there!"
      message "Message" "$Message"
      reboot
  
    elif [[ $so1 = "3" ]]; then # Rename
      checkSettings "Developer Mode"; devmode=$value
      if [[ $devmode == "ON" ]]; then
        selectOptions "Rename Custom or Default [DEV OPTION]" "Select Script" "Select Valid Script" "Custom" "Default"
  
  
  
        if [[ $SO = "1" ]]; then
          customScriptNames=$(<script_names/customScripts.txt)
      
          SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
          IFS=$'\n'      # Change IFS to newline char
          customScriptNames=($customScriptNames) # split the `customScriptNames` string into an array by the same name
          IFS=$SAVEIFS   # Restore original IFS
      
      
          selectOptions "Script to Rename" "Select Script to Rename" "Select a Valid Script to Rename" "${customScriptNames[@]}"
      
          scriptToRename=$(sed "${SO}!d" script_names/customScripts.txt)
      
          
          getInput "New Script Name" "Type a new script name" "Very Cool Script"
          SI=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
          cd custom_scripts
          mv "${scriptToRename}" "$SI"
          cd ../
          cd script_names
          sed -i "s/$scriptToRename/$SI/g" customScripts.txt
          cd ../
          cd "custom_scripts/$SI"
          bashScript=$(find -maxdepth 1 -type f -name "*.sh")
          if [ ! -z "$bashScript" ]; then
            sed -i 's/current="'$scriptToRename'"/current="'"$SI"'"/g' "$bashScript"
          fi
          cd ../../
          Message="Script sucessfully renamed!"
          message "Message" "$Message"
          reboot
  
    
        elif [[ $SO = "2" ]]; then
          defaultScriptNames=$(<script_names/defaultScripts.txt)
      
          SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
          IFS=$'\n'      # Change IFS to newline char
          defaultScriptNames=($defaultScriptNames) # split the `defaultScriptNames` string into an array by the same name
          IFS=$SAVEIFS   # Restore original IFS
      
      
          selectOptions "Script to Rename" "Select Script to Rename" "Select a Valid Script to Rename" "${defaultScriptNames[@]}"
      
          scriptToRename=$(sed "${SO}!d" script_names/defaultScripts.txt)
      
          
          getInput "New Script Name" "Type a new script name" "Very Cool Script"
          SI=$(echo "$SI" | awk '{print tolower($0)}' | sed -e "s/\b\(.\)/\u\1/g ")
          cd scripts
          mv "${scriptToRename}" "$SI"
          cd ../
          cd script_names
          sed -i "s/$scriptToRename/$SI/g" defaultScripts.txt
          cd ../
          cd "scripts/$SI"
          bashScript=$(find -maxdepth 1 -type f -name "*.sh")
          if [ ! -z "$bashScript" ]; then
            sed -i 's/current="'$scriptToRename'"/current="'"$SI"'"/g' "$bashScript"
          fi
          cd ../../
          Message="Script sucessfully renamed!"
          message "Message" "$Message"
          reboot
        fi
      fi
  
  
  
    elif [[ $so1 = "4" ]]; then
      checkSettings "Developer Mode"; devmode=$value
      if [[ $devmode == "ON" ]]; then
        selectOptions "Delete Custom or Default [DEV OPTION]" "Select Script" "Select Valid Script" "Custom" "Default"
        if [[ $SO = "1" ]]; then
          customScriptNames=$(<script_names/customScripts.txt)
      
          SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
          IFS=$'\n'      # Change IFS to newline char
          customScriptNames=($customScriptNames) # split the `customScriptNames` string into an array by the same name
          IFS=$SAVEIFS   # Restore original IFS
      
      
          selectOptions "Script to Delete" "Select Script to Delete" "Select a Valid Script to Delete" "${customScriptNames[@]}"
      
          scriptToDelete=$(sed "${SO}!d" script_names/customScripts.txt)
      
          grep -v "$scriptToDelete" script_names/customScripts.txt > script_names/customScripts.tmp
          mv script_names/customScripts.tmp script_names/customScripts.txt
          
      
      
          cd custom_scripts
          rm -rf "${scriptToDelete}"
          cd ../
          Message="Script sucessfully deleted!"
          message "Message" "$Message"
          reboot
    
    
    
    
        elif [[ $SO = "2" ]]; then
          defaultScriptNames=$(<script_names/defaultScripts.txt)
      
          SAVEIFS=$IFS   # Save current IFS (Internal Field Separator)
          IFS=$'\n'      # Change IFS to newline char
          defaultScriptNames=($defaultScriptNames) # split the `defaultScriptNames` string into an array by the same name
          IFS=$SAVEIFS   # Restore original IFS
      
      
          selectOptions "Script to Delete" "Select Script to Delete" "Select a Valid Script to Delete" "${defaultScriptNames[@]}"
      
          scriptToDelete=$(sed "${SO}!d" script_names/defaultScripts.txt)
      
          grep -v "$scriptToDelete" script_names/defaultScripts.txt > script_names/defaultScripts.tmp
          mv script_names/defaultScripts.tmp script_names/defaultScripts.txt
          
      
      
          cd scripts
          rm -rf "${scriptToDelete}"
          cd ../
          Message="Default script sucessfully deleted!"
          message "Message" "$Message"
          reboot
        fi
      fi
    fi
  fi
  
  
  if [[ $SS == "s" ]]; then
    current="Settings"
    selectOptions "Settings"  "Select Setting to Modify" "Select Existing Setting to modify" "settings.tropx"
    optionToChange=$SO
  
    settingCount=$(expr $(wc -l < settings.tropx) + 1)
    selection="$(seq 1 $settingCount)"
    for i in $selection; do
      if [[ $optionToChange == "$i" ]]; then
        setting=$(sed ${optionToChange}!d settings.tropx)
        setting=$(echo $setting | sed 's/ :.*//')
        changeOption "$setting"
      fi
    done
  fi
  
  
  if [[ $SS == "h" ]]; then
    current="Help"
    helpMessage="To learn how to efficiently use ${SECONDARY}TropX${PRIMARY}, please refer to it's github:\n${SECONDARY}https://github.com/troopek/TropX${PRIMARY}"
    message "Message" "$helpMessage"
  fi
  
  
  if [[ $SS == "n" ]]; then
    x-terminal-emulator -e "bash main.sh"
  fi
  
  
  # if [[ $SS == "u" ]]; then
  #   git remote update
  
  #   output=$(git status -uno)
  #   if [[ $output != *"pull"* ]]; then
  #     message "Message" "TropX is up to date!"
  #   else
  #     selectOptions "New version available" "Select Option" "Select valid Option" "Yes, Update TropX" "No, Don't Update TropX"
  #   git pull
  #   fi
  # fi
  
  
  
  
  
  if [[ $SS -le $default_scripts ]]; then
    defaultScriptCount=$(wc -l < script_names/defaultScripts.txt)
    selection="$(seq 1 $defaultScriptCount)"
    for i in $selection; do
      if [[ $SS == "$i" ]]; then
        inScript=true
  
        scriptName=$(sed -e "${SS}!d" script_names/defaultScripts.txt)
        bash "scripts/$scriptName/main.sh"
      fi
    done
  fi
  
  
  if [[ $SS -gt $default_scripts ]]; then
    customScriptCount=$(wc -l < script_names/customScripts.txt)
    customSelection="$(seq 1 $customScriptCount)"
    for i in $customSelection; do
      scriptName=$(sed -e "${i}!d" script_names/customScripts.txt)
      if [[ $(sed -e "$((SS - default_scripts))!d" script_names/customScripts.txt) == "$scriptName" ]]; then
        
        bashScript=$(find "custom_scripts/$scriptName/" -maxdepth 1 -type f -name "*.sh")
        if [ ! -z "$bashScript" ]; then
          bash "$bashScript"
        fi
        pythonScript=$(find "custom_scripts/$scriptName/" -maxdepth 1 -type f -name "*.py")
        if [ ! -z "$pythonScript" ]; then
          python3 "$pythonScript"
        fi
    
      fi
    done
  fi
  
  
  mainMenu back
}


################################################################################################################

function selectOptions() {
  stty -echo
  SO=""
  checkSettings "Animations"
  animations=$value
  
  title
  
  
  # here
  
  if [[ "$1" == "error" ]]; then
    shift
    error=true
  fi
  
  
  breadcrumbs "$1"
  
  
  echo -e "$PRIMARY(${SECONDARY}B$PRIMARY) Back To Main Menu" | foldText 6
  
  
  if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
    :
  else
    sleep 0.1
  fi
  
  echo "------------------" | foldText 6
  
  
  if [[ $4 == "settings.tropx" ]]; then
    if [[ $animations == "ON" ]]; then
      awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
          {
              system("sleep 0.1")
              print "("SECONDARY NR PRIMARY") " $0
          }
      ' settings.tropx | foldText 6
    else
      awk -v SECONDARY="$SECONDARY" -v PRIMARY="$PRIMARY" '
          {
              print "("SECONDARY NR PRIMARY") " $0
          }
      ' settings.tropx | foldText 6
    fi
  fi
  
  if [[ $4 != "settings.tropx" ]]; then
    i=1
    if [[ $animations == "ON" ]]; then
      for arg in "${@:4}"
      do
          echo -e "${PRIMARY}(${SECONDARY}${i}$PRIMARY) ${arg}" | foldText 6
          i=$((i+1))
          sleep 0.1
      done
    else
      for arg in "${@:4}"
      do
          echo -e "${PRIMARY}(${SECONDARY}${i}$PRIMARY) ${arg}" | foldText 6
          i=$((i+1))
      done
    fi
  fi
  
  
  echo -e " "
  
  if [[ $error == true ]]; then
    echo -n -e "$SECONDARY$3 > " | foldText 4
  else
    echo -n -e "$SECONDARY$2 > " | foldText 4
  fi
  
  echo -n -e "$PRIMARY"
  stty echo
  read SO
  SO=${SO,,}
  
  if [[ $SO == "b" ]]; then
    mainMenu error
  fi
  
  
  if [[ $4 == "settings.tropx" ]]; then
    settingCount=$(expr $(wc -l < settings.tropx) + 1)
    selection="$(seq 1 $settingCount)"
  else
    arguments="$(($#-3))"
    selection="$(seq 1 $arguments)"
  fi
  
  
  if [[ "$(containsElement "$SO" ${selection[@]})" != "0" ]]; then 
  
    until [[ "$(containsElement "$SO" ${selection[@]})" == "0" ]] #unti the result is not an error
    do
      selectOptions "error" "$1" "$2" "$3" "$4" "${@:5}"
    done
  
  fi
  error=""
}

################################################################################################################

function getInput() {
  stty -echo
  SI=""
  title
  
  
  if [[ "$1" == "error" ]]; then
    shift
  fi
  
  breadcrumbs "$1"
  
  if [[ $animations == "OFF" ]] || [[ $animations == "MINIMAL" ]]; then
      echo -e "$PRIMARY(${SECONDARY}DETAILS$PRIMARY) $2" | foldText 6
      echo " "
      echo -e "$PRIMARY(${SECONDARY}EXAMPLE$PRIMARY) $3" | foldText 6
  else
      echo -e "$PRIMARY(${SECONDARY}DETAILS$PRIMARY) $2" | foldText 6
      echo " "
      sleep 0.1
      echo -e "$PRIMARY(${SECONDARY}EXAMPLE$PRIMARY) $3" | foldText 6
      sleep 0.1
  fi
  
  echo -e " "
  
  if [[ $error == true ]]; then
    echo -n -e "${SECONDARY}Try Again > " | foldText 4
  else
    echo -n -e "${SECONDARY}Type Here > " | foldText 4
  fi
  
  echo -n -e "$PRIMARY"
  stty echo
  read SI
  SI=${SI,,}
  
  if [[ $SI == "b" ]]; then
    mainMenu error
  fi
  error=""
}



################################################################################################################

function message() {
  stty -echo
  
  title
  breadcrumbs "$1"
  
  echo -e "$2" | foldText 6
  echo " "
  echo -e -n "${SECONDARY}Press any key to continue...${PRIMARY}"  | foldText 4
  stty echo
  read -rsp "" -n1 key
}


################################################################################################################

function containsElement() {
  match="$1"
  shift
  for e in "$@"; do 
    if [[ "$e" == "$match" ]]; then
      echo "0"
      return
    fi
  done
  echo "1"
}




################################################################################################################

function foldText {
  checkSettings "Text Folding"; textfolding=$value;
  if [[ "$textfolding" == "ON" ]]; then
    tabs $1
    fold_width=50 # maybe $((50-$1))
    
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

################################################################################################################

function selectSetting() {
text=$1
selection=$2

selected=`echo "$text" | sed -E "s/($selection)/(\1)/g"`
}

################################################################################################################

function changeOption() {
stty -echo
current="Settings / $1"
checkSettings "$1"
selectOptions "$1" "Select New Value" "Select a Valid New Value" $listOptions
newValue=$SO


#get line text of the setting
line=`sed -n "${optionToChange}p" < settings.tropx`
#strip paranthesis
line=${line//(}
line=${line//)}

opt=$(echo "$line" | cut -d: -f2-)
opt=$(echo "$opt" | sed 's/| //g' )
opt=$(echo "$opt" | awk -v nV="${newValue}" '{print $nV}')


selectSetting "$line" "$opt"
# echo $selected

# newLine=$(echo ${text}' : '$selected )
# # sed -i '${newValue}s/.*/$newLine/' settings.tropx
sed -i "${optionToChange}s/.*/$selected/" settings.tropx
stty echo
reboot
}

#########################################

function changeIP() {
  ip_address=$(dd if=/dev/urandom bs=4 count=1 2>/dev/null |
    od -An -tu1 |
    sed -e 's/^ *//' -e 's/  */./g')
  if [[ "$1" == "" ]]; then
    ifconfig $WI $ip_address > /dev/null 2>&1
  elif [[ "$1" == "reset" ]]; then
    airmon-ng check kill > /dev/null 2>&1
    service NetworkManager start > /dev/null 2>&1
  else
    ifconfig $WI $1 > /dev/null 2>&1
  fi
}

##############
function changeWImode() {
  # # airmon-ng check kill > /dev/null 2>&1
  nmcli device disconnect "$WI" > /dev/null 2>&1
	ifconfig "$WI" down > /dev/null 2>&1
	iwconfig "$WI" mode "$1" > /dev/null 2>&1
	ifconfig "$WI" up > /dev/null 2>&1
  # # service NetworkManager start > /dev/null 2>&1
}

############
function changeMac() {
  # airmon-ng check kill > /dev/null 2>&1
  if [[ "$1" == "" ]]; then
    ifconfig ""$WI"" down > /dev/null 2>&1
    macchanger -r ""$WI"" > /dev/null 2>&1
    ifconfig ""$WI"" up > /dev/null 2>&1
  elif [[ "$1" == "reset" ]]; then
    ifconfig ""$WI"" down > /dev/null 2>&1
    macchanger -p ""$WI"" > /dev/null 2>&1
    ifconfig ""$WI"" up > /dev/null 2>&1
  else
    ifconfig "$WI" down > /dev/null 2>&1
    macchanger -m $1 "$WI" > /dev/null 2>&1
    ifconfig "$WI" up > /dev/null 2>&1
  fi
  # service NetworkManager start > /dev/null 2>&1
}

###################################################################

function installPackages {
  for package in "${@}"; do
    REQUIRED_PKG="$package"
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
    echo Checking for $REQUIRED_PKG: $PKG_OK
    clear
    if [ "" = "$PKG_OK" ]; then
      echo "${SECONDARY}$REQUIRED_PKG${PRIMARY} is not yet installed. Setting up ${SECONDARY}$REQUIRED_PKG${PRIMARY}."
      sudo apt --yes install $REQUIRED_PKG
    fi
  done
  clear
}

#########################################
function attackPending {
  stty -echo
  title
  breadcrumbs "$1"
  
  echo -e "Proccess Running ${SECONDARY}/${PRIMARY} Attack Pending" | foldText 6
  echo -e "The current script is running." | foldText 6
  echo " "
  echo -e -n "${SECONDARY}You may open a new instance of TropX elsewhere.${PRIMARY}"  | foldText 4
  
}
#########################################

IP = "ifconfig" | sed -e 's/inet \(.*\) /\1/'

#########################################
function reboot {
  Message="TropX will now restart so your changes take effect."
  message "Message" "$Message"
  exec bash main.sh
}

#########################################
#########################################
#########################################


if [ "$0" = "$BASH_SOURCE" ] ; then
  checkSettings "Auto Resize"; AR=$value
  if [[ $AR == "ON" ]]; then
    resize -s 40 75 > /dev/null 2>&1
  fi
  trap end EXIT
  ready
  mainMenu
fi

# hey