#!/usr/bin/env bash
:


expect -c "
set timeout -1
spawn \"veil\"
expect \"Veil>: \"
send -- \"update\r\"
send -- \"\r\"
expect \"Veil>: \"
send -- \"use\r\"
interact
"
