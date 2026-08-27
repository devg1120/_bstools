
SSH_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$SSH_SCRIPT_DIR/_stack

if [ "$#" -eq 1 ]; then
   if [[ "$1" =~ ^[0-9]+$ ]]; then
       if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
         HN=$1"p"
         HOST=`sed -n ${HN} ${FILE}`
        else
          echo "arg $1 Err"
          exit
        fi
   else
     HOST=$1
   fi
else
  N=`cat ${FILE} | wc --line`
  HN=$N"p"
  HOST=`sed -n ${HN} ${FILE}`
fi

#if [ -d $1 ]; then
# DIR=$1
#else
# if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
#   HN=$1"p"
#   DIR=`sed -n ${HN} ${FILE}`
#  else
#    echo "arg $1 Err"
#    exit
#  fi
#fi

if [ -z $HOST ]; then
 echo "HOST error: zero"
 exit
fi

$SSH_SCRIPT_DIR/stk_push.sh $HOST
ssh $HOST -F  ${SSH_SCRIPT_DIR}/ssh_config

