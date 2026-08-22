BSTOOLS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

usage() {
         echo "SESSION   bs s"
         echo "DIR       bs w"
         echo "TREE      bs t"
         echo "DIFF      bs d"
         echo "FIND      bs f"
}

if [ "$#" -eq 0 ]; then
   usage
   exit
fi

session() {
          cat ${BSTOOLS_DIR}/SESSION/wdc_help;\
          cat ${BSTOOLS_DIR}/SESSION/wdc_alias | grep  --color=never alias;\
}

dir() {
          cat ${BSTOOLS_DIR}/DIR/stk_help;\
          cat ${BSTOOLS_DIR}/DIR/stk_alias | grep  --color=never alias;\
}

tree() {
          cat ${BSTOOLS_DIR}/TREE/tree_help;\
          cat ${BSTOOLS_DIR}/TREE/tree_alias | grep  --color=never alias;\
}

diff() {
          cat ${BSTOOLS_DIR}/DIFF/diff_help;\
          cat ${BSTOOLS_DIR}/DIFF/diff_alias | grep  --color=never alias;\
}

find() {
          cat ${BSTOOLS_DIR}/FIND/find_help;\
          cat ${BSTOOLS_DIR}/FIND/find_alias | grep  --color=never alias;\
}

case ${1} in
  "s" )
	  session
     ;;
  "w" )
	  dir
     ;;
  "t" )
	  tree
     ;;
  "d")
	  diff
     ;;
  "f" )
	  find
     ;;
  "-")
	  session
	  dir
	  tree
	  diff
	  find
     ;;
  *)
	  usage
esac

# cat ${BSTOOLS_DIR}/SESSION/wdc_help;\
# cat ${BSTOOLS_DIR}/SESSION/wdc_alias | grep  --color=never alias;\
# cat ${BSTOOLS_DIR}/DIR/stk_help;\
# cat ${BSTOOLS_DIR}/DIR/stk_alias | grep  --color=never alias;\
# cat ${BSTOOLS_DIR}/TREE/tree_help;\
# cat ${BSTOOLS_DIR}/TREE/tree_alias | grep  --color=never alias;\
# cat ${BSTOOLS_DIR}/DIFF/diff_help;\
# cat ${BSTOOLS_DIR}/DIFF/diff_alias | grep  --color=never alias;\
# cat ${BSTOOLS_DIR}/FIND/find_help;\
# cat ${BSTOOLS_DIR}/FIND/find_alias | grep  --color=never alias;\
# cat ${BSTOOLS_DIR}/GREP/grep_help;\
# cat ${BSTOOLS_DIR}/GREP/grep_alias | grep  --color=never alias;\




