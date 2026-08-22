

DIFF_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$DIFF_SCRIPT_DIR/_stack

if [ ! -f ${FILE} ]; then
   touch ${FILE}
fi

#IFS=$'\n'
#for line in `cat ${FILE}`
#do
#if [ "$line" = "$PWD" ]; then
#    exit 0
#fi
#done


#echo $PWD ">>" ${FILE}
#echo $PWD >> ${FILE}

if [ "$#" -ne 2 ]; then
   echo error
   exit
fi

#dir1="$(cd -- "$(dirname -- "$1")" && pwd)" || exit $?
#path1="${dirname%/}/$(basename -- "$1")"
#dir2="$(cd -- "$(dirname -- "$2")" && pwd)" || exit $?
#path2="${dirname%/}/$(basename -- "$2")"

path1=$(cd -- $1 && pwd)
path2=$(cd -- $2 && pwd)

echo "$path1  $path2" >> ${FILE}




