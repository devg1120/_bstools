

VI_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$VI_SCRIPT_DIR/_stack

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

if [ -z "$1" ]; then
   echo filename must be
   exit
fi
if [ ! -f $1 ]; then
    echo $1  file not exist
    exit
fi

#echo $PWD ">>" ${FILE}
#echo $PWD >> ${FILE}

if [ -n "$1" ]; then
   echo $PWD/$1 ">>" ${FILE}
   echo $PWD/$1 >> ${FILE}
else
   echo $PWD ">>" ${FILE}
   echo $PWD >> ${FILE}
fi

tail -n 10 ${FILE}  > ${FILE}.tmp && mv ${FILE}.tmp ${FILE}



