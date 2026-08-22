if [ "$#" -eq 1 ]; then
cd $1
fi
#pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'
pwd;find .  -not \( -path '*/.git*' -o -path '*/node_modules*' \) | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'

