#!/usr/bin/env bash


BSTOOLS_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source $BSTOOLS_DIR/_bstools_rc

usage() {
         echo "SESSION     bs s[_]  _s[_] "
         echo "WORK DIR    bs w[_]  _w[_] "
         echo "TREE        bs t[_]  _t[_] "
         echo "DIFF        bs d[_]  _d[_] "
         echo "FIND        bs f[_]  _f[_] "
         echo "GREP        bs g[_]  _g[_] "
         echo "REPLACE     bs r[_]  _r[_] "
         echo "VI          bs v[_]  _v[_] "
         echo "all         bs +[_]  _+[_] "
         echo "alias       bs a  _a       "
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




