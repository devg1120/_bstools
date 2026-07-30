

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

if [ -n "$1" ]; then
   echo $PWD/$1 ">>" ${FILE}
   echo $PWD/$1 >> ${FILE}
else
   echo $PWD ">>" ${FILE}
   echo $PWD >> ${FILE}
fi

tail -n 2 ${FILE}  > ${FILE}.tmp && mv ${FILE}.tmp ${FILE}



