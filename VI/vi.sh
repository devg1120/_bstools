
VI_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$VI_SCRIPT_DIR/_stack


if [[ "$1" =~ ^[0-9]+$ ]]; then
 if [ $1 -ge 1 ] && [ $1 -le 10 ]; then
   HN=$1"p"
   DIR=`sed -n ${HN} ${FILE}`
  else
    echo "arg $1 Err"
    exit
  fi

else
 if [ -f $1 ]; then
  DIR=$1
 else
    echo "arg $1 Err"
    exit
 fi
fi


if [ -z $DIR ]; then
 echo "FILE error: zero"
 exit
fi

if [ ! -f $DIR ]; then
 echo "DIR error: not directory:"$DIR
 exit
fi

vi ${DIR} -u $VI_SCRIPT_DIR/vimrc

