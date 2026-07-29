
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$SCRIPT_DIR/_wdc.history

HN=1p

if [ "$#" -eq 1 ]; then
  #echo "引数の数は 1 です"
  HN=$1"p"
else
  #echo "引数の数は 1 以外の $# です"
  echo " arg err: hc [N]   N:history number"
  exit
fi

if [ ! -f ${FILE} ]; then
  echo " file not found ${FILE}"
  #touch ${FILE}
  exit
fi


#cat -n ${FILE}

#sed -n '2p' ${FILE}
DIR=`sed -n ${HN} ${FILE}`
echo ">> " ${DIR}
echo ${DIR}  >> ${FILE}

$SCRIPT_DIR/wdc_history_print.sh

