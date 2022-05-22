#!/usr/bin/env bash



function installPackages {
  for package in "${@}"; do
    # check if installed already
    REQUIRED_PKG="$package"
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
    echo Checking for $REQUIRED_PKG: $PKG_OK
    if [ "" = "$PKG_OK" ]; then
      echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
      sudo apt --yes install $REQUIRED_PKG
    fi
  done
}

installPackages "pv" "python3" "node"