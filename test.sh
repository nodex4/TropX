#!/usr/bin/env bash
:
scriptToRename="Script"
SI="New Skript"
bashScript="test.txt"
sed -i 's/current="'$scriptToRename'"/current="'"$SI"'"/g' "$bashScript"