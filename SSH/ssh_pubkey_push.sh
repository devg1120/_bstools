
SSH_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

HOSTNAME=$1

if [[ -z "$HOSTNAME" ]]; then
     echo  hostname empty
     exit
fi
count=0
SP=0
SECTION=0
FOUND=0

_HOST=""
_PORT=""
_USER=""
_KEYFILE=""

while IFS= read -r line; do
    #echo $line
    count=$((count+1))

    if [[ "$line" == "Host"* ]]; then
	SECTION=0
        #echo $line
	param=(${line// / })
	if [ "${param[1]}" = "$HOSTNAME" ]; then
           #echo $line
	   SP=$count
	   SECTION=1
	   FOUND=1
        fi 
    else
       if [[ "$SECTION" = "1" ]]; then
            #echo ">" $line
	    param=(${line// / })
	    if [ "${param[0]}" = "HostName" ]; then
	        _HOST=${param[1]}
	    elif [ "${param[0]}" = "Port" ]; then
	        _PORT=${param[1]}
	    elif [ "${param[0]}" = "User" ]; then
	        _USER=${param[1]}
	    elif [ "${param[0]}" = "IdentityFile" ]; then
	        _KEYFILE="${param[1]}"
            fi 
       fi
    fi
done < "${SSH_SCRIPT_DIR}/ssh_config"

#echo $SP

if [[ "$SP" = "0" ]]; then
    echo not found hostname: $HOSTNAME
    exit
fi

#read -p "ok? (y/N): " yn
#case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

echo "SET  " $_HOST  $_PORT $_USER $_KEYFILE

_KEYFILE2=`echo ${_KEYFILE/"~"/"$HOME"}`

echo $_KEYFILE2
echo ------------------------------
cat $_KEYFILE2.pub
echo ------------------------------

read -p "ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac




cat ${_KEYFILE2}.pub | ssh -p $_PORT ${_USER}@${_HOST} \
    "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"



