
FIND_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$FIND_SCRIPT_DIR/_stack

if [ -d $1 ]; then
 DIR=$1
else
 if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
   HN=$1"p"
   DIR=`sed -n ${HN} ${FILE}`
  else
    echo "arg $1 Err"
    exit
  fi
fi

if [ -z $DIR ]; then
 echo "DIR error: zero"
 exit
fi

TCASE=$2
TV=$3

#find . -type f -regextype egrep -not -regex  'node_modules' -name '*' -print
#find ${DIR} -type d -regextype egrep -not -regex  '.+node_modules.+' -name ${EXT} -print


#day +4  ago
#day -4   with in

#min +4   ago
#min -4   with in

#yyyymmdd  

#   bash find_dir_times.sh  times_test_dir/top/  day +10
#   bash find_dir_times.sh  times_test_dir/top/  day -10
#   bash find_dir_times.sh  times_test_dir/top/  day -1
#   bash find_dir_times.sh  times_test_dir/top/  min -60
#   bash find_dir_times.sh  times_test_dir/top/  min -120
#   bash find_dir_times.sh  times_test_dir/top/  ymd_win "2026-08-23"
#   bash find_dir_times.sh  times_test_dir/top/  ymd_win "2026-06-23"
#   bash find_dir_times.sh  times_test_dir/top/  ymd_ago "2026-06-23"
#   bash find_dir_times.sh  times_test_dir/top/  ymd_btw "2026-06-23:2026-08-23"

case "$TCASE" in
  "day")
    find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+' -mtime ${TV} -print
    ;;
  "min")
    find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+' -mmin ${TV} -print
    ;;
  "ymd_win")
    find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+' -newermt ${TV} -print
    ;;
  "ymd_ago")
    find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+'  ! -newermt ${TV} -print
    ;;
  "ymd_btw")
     V=(${TV//:/ })
     V1=${V[0]}
     V2=${V[1]}
    find ${DIR} -type f -regextype egrep -not -regex  '.+node_modules.+'  -newermt ${V1} ! -newermt ${V2} -print
    ;;
  *)
    # どこにも一致しないときの処理（デフォルト）
    ;;
esac



