

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$SCRIPT_DIR/_stack

HN=1p

if [ "$#" -eq 1 ]; then
  #echo "引数の数は 1 です"
  HN=$1"p"
else
  #echo "引数の数は 1 以外の $# です"
  echo " arg err: hc [N]   N:history number"
  return
fi

if [ ! -f ${FILE} ]; then
   touch ${FILE}
fi


#cat -n ${FILE}

#sed -n '2p' ${FILE}
DIR=`sed -n ${HN} ${FILE}`

#echo "chdir:  $DIR"
#echo $DIR
if [ -d "$DIR" ]; then
  cd $DIR
else
  echo " not found histry number:$1"
fi



