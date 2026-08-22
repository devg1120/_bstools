
DIFF_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
#$DIFF_SCRIPT_DIR/_DIFF.sh 3 $1 $2


#diff_context.sh
#diff_side_by_side.sh
#diff_side_by_side_all.sh
#diff_unified.sh


DIFF_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$DIFF_SCRIPT_DIR/_stack

MODE=1
HN=1p

if [ "$#" -eq 2 ]; then
  #echo "引数の数は 1 です"
  MODE=$1
  HN=$2"p"

else
  #echo "引数の数は 1 以外の $# です"
  echo " arg err: $1 s sa c u"
  exit
fi

if [ ! -f ${FILE} ]; then
   touch ${FILE}
fi


#cat -n ${FILE}

#sed -n '2p' ${FILE}
ENTRY=`sed -n $HN ${FILE}`
echo $ENTRY
if [  -z "$ENTRY" ]; then
 echo number error
fi

DIR=(${ENTRY// / })

echo ${DIR[0]}
echo ${DIR[1]}
DIR1=${DIR[0]}
DIR2=${DIR[1]}


#if [ -d "$DIR" ]; then
#  cd $DIR
#else
#  echo " not found histry number:$1"
#fi

if [ "$DIR1" == "" ]; then
  echo " err 1"
  exit
fi

if [ "$DIR2" == "" ]; then
  echo " err 2"
  exit
fi

#case ${MODE} in
#  "s")
#     bash ${DIFF_SCRIPT_DIR}/diff_side_by_side.sh   $DIR1 $DIR2;;
#  "sa")
#     bash ${DIFF_SCRIPT_DIR}/diff_side_by_side_all.sh  $DIR1 $DIR2;;
#  "c")
#     bash ${DIFF_SCRIPT_DIR}/diff_context.sh  $DIR1 $DIR2;;
#  "u")
#     bash ${DIFF_SCRIPT_DIR}/diff_unified.sh  $DIR1 $DIR2;;
#  *)
#    echo "MODE err"
#esac

echo ---
if [ -f "$DIR1" ]; then
case ${MODE} in
  "s")
     bash ${DIFF_SCRIPT_DIR}/_FDIFF.sh  1 $DIR1 $DIR2;;
  "sa")
     bash ${DIFF_SCRIPT_DIR}/_FDIFF.sh  2 $DIR1 $DIR2;;
  "c")
     bash ${DIFF_SCRIPT_DIR}/_FDIFF.sh  3 $DIR1 $DIR2;;
  "u")
     bash ${DIFF_SCRIPT_DIR}/_FDIFF.sh  4 $DIR1 $DIR2;;
  *)
    echo "MODE err"
esac
fi

if [ -d "$DIR1" ]; then
case ${MODE} in
  "s")
     bash ${DIFF_SCRIPT_DIR}/_DIFF.sh  1 $DIR1 $DIR2;;
  "sa")
     bash ${DIFF_SCRIPT_DIR}/_DIFF.sh  2 $DIR1 $DIR2;;
  "c")
     bash ${DIFF_SCRIPT_DIR}/_DIFF.sh  3 $DIR1 $DIR2;;
  "u")
     bash ${DIFF_SCRIPT_DIR}/_DIFF.sh  4 $DIR1 $DIR2;;
  *)
    echo "MODE err"
esac
fi
