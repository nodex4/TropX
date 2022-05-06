#!/bin/bash

source functions.sh
##########################
#install necessary packages


##########################
# apt-get install pv


##########################
#create custom script files if they dont exist already
if [ ! -d custom_scripts ]; then
  mkdir -p custom_scripts;
fi

if [ ! -f customScripts.txt ]; then
  touch customScripts.txt;
fi

if [ ! -e customIfs.sh ]; then
  touch customIfs.sh;
  echo "#!/bin/bash" > customIfs.sh
  echo "
function customIFs() {
  :
}" >> customIfs.sh
fi

##########################
#explain usage


##########################
#make them select their wireless interface using changeOption 
changeOption "Wireless Interface" setup