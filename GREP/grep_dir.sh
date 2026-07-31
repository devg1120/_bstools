
GREP_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$GREP_SCRIPT_DIR/_stack

if [ -d $1 ]; then
 DIR=$1
else
 if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
   HN=$1"p"
   DIR=`sed -n ${HN} ${FILE}`
  else
    echo "arg $1 Err"
    exit
  fi
fi

if [ -z $DIR ]; then
 echo "DIR error: zero"
 exit
fi

MODE=$2
case "$MODE" in
 "unit")
       #REGX=$3
       REGX="${3//|/\\|}"
       ;;
 "or")
       #REGX_ARR=("else" "func")
       REGX_ARR=(${3//|/ })
       ;;
 "and")
       REGX_ARR=(${3//|/ })
       ;;
 *)
       echo "MODE ERR:" $MODE
       exit
       ;;
esac

#REGX_ARR=("else" "func")
for ((i=0; i<${#REGX_ARR[@]}; i++))
do
  echo "${REGX_ARR[$i]}"
done

#export GREP_COLOR='1;33'


#grep --color=auto  -rn ${REGX} ${DIR} --exclude-dir='node_modules'

# OR
#grep --color=auto  -rn "else\|func" ${DIR} --exclude-dir='node_modules'
#grep --color=auto  -rn -e else -e func ${DIR} --exclude-dir='node_modules'

# AND
#grep  -rn  else  ${DIR} --exclude-dir='node_modules' | grep  props | grep --color=auto  "drag*"
#grep  -rn  .  ${DIR} --exclude-dir='node_modules' | grep  else | grep  props | grep --color=always  "drag*"
#grep  -rn  .  ${DIR} --exclude-dir='node_modules' --exclude-dir='.*'| grep  else | grep  props | grep   drag | grep --color=always -E "else|props|drag"

# EVAL
#cmd="grep --color=auto  -rn -e else -e func ${DIR} --exclude-dir=node_modules"
#eval $cmd

#MODE=unit
#REGX="else\|func"
#REGX="func"
#REGX=$2

#MODE=or
#REGX_ARR=("else" "func")

#MODE=and
#REGX_ARR=("else" "props" "drag")

EXDIR="\
 --exclude-dir=node_modules\
 --exclude-dir='dist'\
 --exclude-dir='build'\
 --exclude-dir='.*'\
"

if [ $MODE == "unit" ]; then
  #grep --color=always  -rn ${REGX} ${DIR} --exclude-dir='node_modules' --exclude-dir='.*'
  #cmd="grep --color=always  -rn -E ${REGX} ${DIR} --exclude-dir=node_modules --exclude-dir='.*'"
  cmd="grep --color=always  -rn -E ${REGX} ${DIR} ${EXDIR}"
  echo $cmd
  eval $cmd

fi

if [ $MODE == "or" ]; then
  HEAD="grep --color=always -rn "
  #TAIL="--exclude-dir=node_modules"
  #TAIL="--exclude-dir=node_modules --exclude-dir='.*'"
  TAIL="--exclude-dir=node_modules ${EXDIR}"
  
  OPT=""
  for str in ${REGX_ARR[@]}; do
    echo $str
    OPT=$OPT"-e "$str" "
  done
  cmd="$HEAD $OPT ${DIR} $TAIL"
  
  echo $cmd
  eval $cmd
fi

if [ $MODE == "and" ]; then
  HEAD="grep -rn . "
  #TAIL="--exclude-dir=node_modules --exclude-dir='.*'"
  TAIL="--exclude-dir=node_modules ${EXDIR}"
  #PIPE="| grep  "
  #PIPE_TAIL="| grep  --color=always "
  
  PIPE=""
  i=0
  len=${#REGX_ARR[@]}
  PTN=""

  for str in ${REGX_ARR[@]}; do
    let i++
    #echo "$i/$len $str"
    #PIPE=$PIPE"| grep "$str" "
    if [ "$i" -eq "$len" ]; then
       #PIPE=$PIPE"| grep --color=always "$str" "
       PIPE=$PIPE"| grep "$str" "
       PTN=$PTN"$str"
    else
       PIPE=$PIPE"| grep "$str" "
       PTN=$PTN"$str|"
    fi
  done
  PIPE_TAIL="| grep --color=always -E \"$PTN\" "
  cmd="$HEAD  ${DIR} $TAIL $PIPE $PIPE_TAIL"
  
  echo $cmd
  eval $cmd
fi
