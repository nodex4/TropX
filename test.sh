#!/usr/bin/env bash

source main.sh

customScriptNames1=$(<script_names/defaultScripts.txt)
customScriptNames2=$(<script_names/customScripts.txt)
customScriptNames="${customScriptNames1}
${customScriptNames2}"
echo "$customScriptNames"