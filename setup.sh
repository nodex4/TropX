#!/bin/bash
#install necessary packages
# apt-get install pv

if [ ! -d custom_scritps ]; then
  mkdir -p custom_scritps;
fi

if [ ! -e customIfss.sh ]; then
  touch customIfss.sh;
  echo "#!/bin/bash" > customIfss.sh
  echo "
function customIFs() {
  :
}" > customIfss.sh
fi

