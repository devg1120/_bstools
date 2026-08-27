
FIND_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$FIND_SCRIPT_DIR/_stack

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

EXT=$2
#find . -type f -regextype egrep -not -regex  'node_modules' -name '*' -print
find ${DIR} -type d -regextype egrep -not -regex  '.+node_modules.+' -name ${EXT} -print

