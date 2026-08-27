#!/usr/bin/env bash


BSTOOLS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source $BSTOOLS_DIR/_bstools_rc

usage() {
         echo "SESSION     bs s  / _s "
         echo "WORK DIR    bs w  / _w "
         echo "TREE        bs t  / _t "
         echo "DIFF        bs d  / _d "
         echo "FIND        bs f  / _f "
         echo "GREP        bs g  / _g "
         echo "REPLACE     bs r  / _r "
         echo "VI          bs v  / _v "
         echo "SSH         bs h  / _h "
         echo "all         bs +  / _+ "
         echo "alias       bs a  / _a       "
}

if [ "$#" -eq 0 ]; then
   usage
   exit
fi

session_() {
          cat ${BSTOOLS_DIR}/SESSION/wdc_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/SESSION/wdc_alias | grep  --color=never alias;\
          fi
}

dir_() {
          cat ${BSTOOLS_DIR}/DIR/stk_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/DIR/stk_alias | grep  --color=never alias;\
          fi
}

tree_() {
          cat ${BSTOOLS_DIR}/TREE/tree_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/TREE/tree_alias | grep  --color=never alias;\
          fi
}

diff_() {
          cat ${BSTOOLS_DIR}/DIFF/diff_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/DIFF/diff_alias | grep  --color=never alias;\
          fi
}

find_() {
          cat ${BSTOOLS_DIR}/FIND/find_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/FIND/find_alias | grep  --color=never alias;\
          fi
}

grep_() {
          cat ${BSTOOLS_DIR}/GREP/grep_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/GREP/grep_alias | grep  --color=never alias;\
          fi
}

replace_() {
          cat ${BSTOOLS_DIR}/REPLACE/replace_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/REPLACE/replace_alias | grep  --color=never alias;\
          fi
}

vi_() {
          cat ${BSTOOLS_DIR}/VI/vi_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/VI/vi_alias | grep  --color=never alias;\
          fi
}

ssh_() {
          cat ${BSTOOLS_DIR}/SSH/ssh_help;\
          if [ -n "$1" ]; then
          cat ${BSTOOLS_DIR}/SSH/ssh_alias | grep  --color=never alias;\
          fi
}
alias_() {
         alias |grep  "^alias _" | less
}

case ${1} in
  "s" )
	  session_ 
     ;;
  "s_" )
	  session_ alias
     ;;
  "w" )
	  dir_ 
     ;;
  "w_" )
	  dir_ alias
     ;;
  "t" )
	  tree_ 
     ;;
  "t_" )
	  tree_ alias
     ;;
  "d")
	  diff_ 
     ;;
  "d_")
	  diff_ alias
     ;;
  "f" )
	  find_ 
     ;;
  "f_" )
	  find_ alias
     ;;
  "g" )
	  grep_ 
     ;;
  "g_" )
	  grep_ alias
     ;;
  "r" )
	  replace_ 
     ;;
  "r_" )
	  replace_ alias
     ;;
  "v" )
	  vi_ 
     ;;
  "v_" )
	  vi_ alias
     ;;
  "h" )
	  ssh_ 
     ;;
  "h_" )
	  ssh_ alias
     ;;
  "+")
	  (
	  session_
	  dir_
	  tree_
	  diff_
	  find_
	  grep_
	  replace_
	  vi_
	  ssh_
  ) | less
     ;;
  "+_")
	  (
	  session_ alias
	  dir_ alias
	  tree_ alias
	  diff_ alias
	  find_ alias
	  grep_ alias
	  replace_ alias
	  vi_ alias
	  ssh_ alias
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




