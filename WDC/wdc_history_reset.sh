

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
FILE=$SCRIPT_DIR/_wdc.history


if [ -f ${FILE} ]; then
   rm -f  ${FILE}
   touch ${FILE}
fi




