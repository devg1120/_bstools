
FIND_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$FIND_SCRIPT_DIR/_stack


if [[ "$1" =~ ^[0-9]+$ ]]; then
 if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
   HN=$1"p"
   DIR=`sed -n ${HN} ${FILE}`
  else
    echo "arg $1 Err"
    exit
  fi

else
 if [ -d $1 ]; then
  DIR=$1
 else
    echo "arg $1 Err"
    exit
 fi
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

if [ -z $DIR ]; then
 echo "DIR error: zero"
 exit
fi

if [ ! -d $DIR ]; then
 echo "DIR error: not directory:"$DIR
 exit
fi
EXT=$2
#find . -type f -regextype egrep -not -regex  'node_modules' -name '*' -print
find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+' -name ${EXT} -print

