
FIND_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$FIND_SCRIPT_DIR/_stack

if [ -f $1 ]; then
 FILE=$1
fi

if [ -z $FILE ]; then
 echo "FILE error: zero"
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

dirname="$(cd -- "$(dirname -- "$FILE")" && pwd)" || exit $?
AFILE="${dirname%/}/$(basename -- "$FILE")"

AFILE=${AFILE%/}
TARGET_FILE=$AFILE"_"
BEFORE=$2
AFTER=$3

echo $AFILE
echo $TARGET_FILE

cp  $AFILE $TARGET_FILE
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}


