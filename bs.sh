#!/usr/bin/env bash


BSTOOLS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source $BSTOOLS_DIR/_bstools_rc

usage() {
         echo "SESSION     bs s"
         echo "WORK DIR    bs w"
         echo "TREE        bs t"
         echo "DIFF        bs d"
         echo "FIND        bs f"
         echo "GREP        bs g"
         echo "REPLACE     bs r"
         echo "all         bs -"
         echo "alias       bs a"
}

if [ "$#" -eq 0 ]; then
   usage
   exit
fi

session_() {
          cat ${BSTOOLS_DIR}/SESSION/wdc_help;\
          cat ${BSTOOLS_DIR}/SESSION/wdc_alias | grep  --color=never alias;\
}

dir_() {
          cat ${BSTOOLS_DIR}/DIR/stk_help;\
          cat ${BSTOOLS_DIR}/DIR/stk_alias | grep  --color=never alias;\
}

tree_() {
          cat ${BSTOOLS_DIR}/TREE/tree_help;\
          cat ${BSTOOLS_DIR}/TREE/tree_alias | grep  --color=never alias;\
}

diff_() {
          cat ${BSTOOLS_DIR}/DIFF/diff_help;\
          cat ${BSTOOLS_DIR}/DIFF/diff_alias | grep  --color=never alias;\
}

find_() {
          cat ${BSTOOLS_DIR}/FIND/find_help;\
          cat ${BSTOOLS_DIR}/FIND/find_alias | grep  --color=never alias;\
}

grep_() {
          cat ${BSTOOLS_DIR}/GREP/grep_help;\
          cat ${BSTOOLS_DIR}/GREP/grep_alias | grep  --color=never alias;\
}

replace_() {
          cat ${BSTOOLS_DIR}/REPLACE/replace_help;\
          cat ${BSTOOLS_DIR}/REPLACE/replace_alias | grep  --color=never alias;\
}

alias_() {
         alias |grep  "^alias _"
}

case ${1} in
  "s" )
	  session_
     ;;
  "w" )
	  dir_
     ;;
  "t" )
	  tree_
     ;;
  "d")
	  diff_
     ;;
  "f" )
	  find_
     ;;
  "g" )
	  grep_
     ;;
  "r" )
	  replace_
     ;;
  "-")
	  (
	  session_
	  dir_
	  tree_
	  diff_
	  find_
	  grep_
	  replace_
  ) | less
     ;;
  "a" )
	 alias_
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




