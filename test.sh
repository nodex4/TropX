#!/usr/bin/env bash

cd "scripts/Manage Mac Address"

echo $(pwd | sed 's#.*/##')
if [[ $(pwd | sed 's#.*/##') != "TropX" ]]; then 
  out=true
  cd ../../
fi

echo $(pwd | sed 's#.*/##')
if [ $out = true ]; then
  cd -
fi


echo $(pwd | sed 's#.*/##')
