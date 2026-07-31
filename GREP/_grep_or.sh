
GREP_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

SN=$1
shift
i=0
REGX=""
for arg in "$@"; do
  let i++
  if [ "$i" -eq 1 ]; then
     #echo "1 $arg"
     REGX=$arg
  else
     #echo "N $arg"
     REGX=$REGX"|$arg"
  fi
done
echo $REGX
bash $GREP_SCRIPT_DIR/grep_dir.sh $SN or $REGX

