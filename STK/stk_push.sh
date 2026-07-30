

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$SCRIPT_DIR/_stack

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


echo $PWD ">>" ${FILE}
echo $PWD >> ${FILE}

tail -n 10 ${FILE}  > ${FILE}.tmp && mv ${FILE}.tmp ${FILE}



