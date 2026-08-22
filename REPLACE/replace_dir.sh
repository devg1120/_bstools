
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

#EXT=$2
#find ${DIR} -type d -regextype egrep -not -regex  '.+node_modules.+' -name ${EXT} -print

#if [[ "$DIR" == */ ]]; then
#  echo slash
#  DIR=${DIR: -1}
#else
#  echo not slash
#fi

dirname="$(cd -- "$(dirname -- "$DIR")" && pwd)" || exit $?
ADIR="${dirname%/}/$(basename -- "$DIR")"

ADIR=${ADIR%/}
TARGET_DIR=$ADIR"_"
BEFORE=$2
AFTER=$3

echo $ADIR
echo $TARGET_DIR

cp -r $ADIR $TARGET_DIR
find ${TARGET_DIR}  -type f | xargs sed -i  "s/${BEFORE}/${AFTER}/g"


