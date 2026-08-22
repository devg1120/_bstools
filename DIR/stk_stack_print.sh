

STK_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$STK_SCRIPT_DIR/_stack

#echo $FILE

if [ ! -f ${FILE} ]; then
   touch ${FILE}
fi

#echo $PWD ">>" ${FILE}
#echo $PWD >> ${FILE}

#tail -n 5 ${FILE}  > ${FILE}.tmp && mv ${FILE}.tmp ${FILE}

cat -n ${FILE}



