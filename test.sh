#!/usr/bin/env bash
:

grep . "script_names/customScripts.txt" > "script_names/customScripts.txt.tmp" && mv "script_names/customScripts.txt.tmp" "script_names/customScripts.txt"

echo $(<"script_names/customScripts.txt") | grep . > "script_names/customScripts.txt"