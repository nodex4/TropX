#!/usr/bin/env bash
source main.sh

current="Test"
ready
title
breadcrumbs "$current" "Test"
cd "custom_scripts/"
cd "Test/"
trap end EXIT
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)

echo "hey"
read 