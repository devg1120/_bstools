

DIFF_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$DIFF_SCRIPT_DIR/_stack

#HN=1p

#if [ "$#" -eq 1 ]; then
#  #echo "引数の数は 1 です"
#  HN=$1"p"
#else
#  #echo "引数の数は 1 以外の $# です"
#  echo " arg err: hc [N]   N:history number"
#  return
#fi

if [ ! -f ${FILE} ]; then
   touch ${FILE}
fi
#echo $FILE
#N=`wc --line ${FILE}`
N=`cat ${FILE} | wc --line`
#echo $N
if [ "$N" -eq 0 ]; then
  return
fi

HN=$N"p"
DN=$N"d"

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

sed -i ${DN}  ${FILE}




