#!/usr/bin/env bash

dir_count=0
skip_dir_count=0
file_count=0

EXCLUDE=("node_modules" "dist" "build")

echo "exclude dir"
for str in ${EXCLUDE[@]}; do
    echo " $str"
done
echo
#echo TREE

traverse() {
  #dir_count=$((dir_count + 1))
  local directory=$1
  local prefix=$2

  local children=("$directory"/*)
  local child_count=${#children[@]}

  for idx in "${!children[@]}"
  do local child="${children[$idx]}"
     child=${child##*/}
     local child_prefix="│   "
     local pointer="├── "

     if [ $idx -eq $(( ${#children[@]} - 1)) ]; then
       pointer="└── "
       child_prefix="    "
     fi


     if [ -d "$directory/$child" ]; then
         skip=0
         for str in ${EXCLUDE[@]}; do
           #echo $str "  " $child
           if [ "$str" == "$child" ]; then
             #echo "skip:" $child
             skip=1
             break
           fi
         done

	 if [ "$skip" -eq 0 ]; then
           echo "${prefix}${pointer}$child/"
           dir_count=$((dir_count + 1))
	   traverse "$directory/$child" "$prefix$child_prefix" 
         else
           echo "${prefix}${pointer}$child/+"
           skip_dir_count=$((skip_dir_count + 1))
	 fi
     else
           echo "${prefix}${pointer}$child"
	   file_count=$((file_count + 1))
     fi
    done
}

root="."
[ "$#" -ne 0 ] && root="$1"
echo $root

#echo  "│ "
traverse $root ""
echo
echo "$((dir_count )) directories, $file_count files"
echo "$((skip_dir_count )) skip directories "
