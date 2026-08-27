build_dir() {
   if [ -d ./top ]; then
     rm -rf ./top
   fi
   
   mkdir ./top
   
   mkdir ./top/001/
   mkdir ./top/001/001/
   mkdir ./top/001/002/
   mkdir ./top/001/003/
   
   mkdir ./top/002/
   mkdir ./top/002/001/
   mkdir ./top/002/002/
   mkdir ./top/002/003/
   
   mkdir ./top/003/
   mkdir ./top/003/001/
   mkdir ./top/003/002/
   mkdir ./top/003/003/
   
   mkdir ./top/004/
   mkdir ./top/004/001/
   mkdir ./top/004/002/
   mkdir ./top/004/003/

   mkdir ./top/005/
   mkdir ./top/005/001/
   mkdir ./top/005/002/
   mkdir ./top/005/003/
}

mktime() {
  YYYYMMDD=$1
  HHmmss=$2
  MODE=$3
  VALUE=$4
  NEW_DATE="$YYYYMMDD $HHmmss"

  case ${MODE} in 
    "ss") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} seconds ago"`
	 ;;
    "mm") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} minutes ago"`
	 ;;
    "HH") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} hours ago"`
	 ;;
    "DD") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} days ago"`
	 ;;
    "MM") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} months ago"`
	 ;;
    "YYYY") 
	 NEW_DATE=`date  '+%Y-%m-%d %H:%M:%S' -d "${YYYYMMDD} ${HHmmss} ${VALUE} years ago"`
	 ;;
  esac

  DATE2=(${NEW_DATE// / })
  YYYYMMDD=${DATE2[0]}
  HHmmss=${DATE2[1]}

  YMD=(${YYYYMMDD//-/ })
  YYYY=${YMD[0]}
  MM=${YMD[1]}
  DD=${YMD[2]}
  
  Hms=(${HHmmss//:/ })
  HH=${Hms[0]}
  mm=${Hms[1]}
  ss=${Hms[2]}
  
  DATES=$YYYY$MM$DD$HH$mm.$ss
  echo $DATES
}

datefmt() {
  STR=$1
  YYYY=${STR:0:4}
  MM=${STR:4:2}
  DD=${STR:6:2}
  HH=${STR:8:2}
  mm=${STR:10:2}
  ss=${STR:13:2}
  #echo $YYYY
  #echo $MM
  #echo $DD
  #echo $HH
  #echo $mm
  #echo $ss
  echo "$YYYY-$MM-$DD $HH:$mm:$ss"
}

test() {
## YYYYMMDDHHmm.ss
DATE=`date '+%Y-%m-%d %H:%M:%S'`

DATES=`mktime $DATE`
echo $DATES

echo "--------------------- ss 10"
DATES=`mktime $DATE ss 10 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE

echo "--------------------- mm 10"
DATES=`mktime $DATE mm 10 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE

echo "--------------------- HH 24"
DATES=`mktime $DATE HH 24 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE

echo "--------------------- DD 1"
DATES=`mktime $DATE DD 1 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE

echo "--------------------- MM 1"
DATES=`mktime $DATE MM 1 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE

echo "--------------------- YYYY 1"
DATES=`mktime $DATE YYYY 1 `
echo $DATES
NEW_DATE=`datefmt $DATES`
echo $DATE
echo $NEW_DATE
}

build_dir

#test

DATE=`date '+%Y-%m-%d %H:%M:%S'`
DATES=`mktime $DATE       `   ;_DATE=`datefmt $DATES`; echo "NOW      $DATES    $_DATE";touch -t $DATES ./top/001/001/_${DATES}_.txt
echo ""
DATES=`mktime $DATE mm 10 `   ;_DATE=`datefmt $DATES`; echo "mm 10    $DATES    $_DATE";touch -t $DATES ./top/001/001/_${DATES}_.txt
DATES=`mktime $DATE mm 20 `   ;_DATE=`datefmt $DATES`; echo "mm 20    $DATES    $_DATE";touch -t $DATES ./top/001/002/_${DATES}_.txt
DATES=`mktime $DATE mm 30 `   ;_DATE=`datefmt $DATES`; echo "mm 30    $DATES    $_DATE";touch -t $DATES ./top/001/003/_${DATES}_.txt
echo ""

DATES=`mktime $DATE HH 10 `   ;_DATE=`datefmt $DATES`; echo "HH 10    $DATES    $_DATE";touch -t $DATES ./top/002/001/_${DATES}_.txt
DATES=`mktime $DATE HH 20 `   ;_DATE=`datefmt $DATES`; echo "HH 20    $DATES    $_DATE";touch -t $DATES ./top/002/002/_${DATES}_.txt
DATES=`mktime $DATE HH 30 `   ;_DATE=`datefmt $DATES`; echo "HH 30    $DATES    $_DATE";touch -t $DATES ./top/002/003/_${DATES}_.txt
echo ""

DATES=`mktime $DATE DD 10 `   ;_DATE=`datefmt $DATES`; echo "DD 10    $DATES    $_DATE";touch -t $DATES ./top/003/001/_${DATES}_.txt
DATES=`mktime $DATE DD 20 `   ;_DATE=`datefmt $DATES`; echo "DD 20    $DATES    $_DATE";touch -t $DATES ./top/003/002/_${DATES}_.txt
DATES=`mktime $DATE DD 30 `   ;_DATE=`datefmt $DATES`; echo "DD 30    $DATES    $_DATE";touch -t $DATES ./top/003/003/_${DATES}_.txt
echo ""

DATES=`mktime $DATE MM 1 `    ;_DATE=`datefmt $DATES`; echo "MM  1    $DATES    $_DATE";touch -t $DATES ./top/004/001/_${DATES}_.txt
DATES=`mktime $DATE MM 3 `    ;_DATE=`datefmt $DATES`; echo "MM  3    $DATES    $_DATE";touch -t $DATES ./top/004/002/_${DATES}_.txt
DATES=`mktime $DATE MM 6 `    ;_DATE=`datefmt $DATES`; echo "MM  6    $DATES    $_DATE";touch -t $DATES ./top/004/003/_${DATES}_.txt
echo ""

DATES=`mktime $DATE YYYY 1 `  ;_DATE=`datefmt $DATES`; echo "YY  1    $DATES    $_DATE";touch -t $DATES ./top/005/001/_${DATES}_.txt
DATES=`mktime $DATE YYYY 3 `  ;_DATE=`datefmt $DATES`; echo "YY  3    $DATES    $_DATE";touch -t $DATES ./top/005/002/_${DATES}_.txt
DATES=`mktime $DATE YYYY 6 `  ;_DATE=`datefmt $DATES`; echo "YY  6    $DATES    $_DATE";touch -t $DATES ./top/005/003/_${DATES}_.txt
echo ""

DIR="./top/001/001"; SIZE="1M"; truncate -s ${SIZE}  $DIR/TR_${SIZE}.big
DIR="./top/001/002"; SIZE="2M"; truncate -s ${SIZE}  $DIR/TR_${SIZE}.big
DIR="./top/001/003"; SIZE="3M"; truncate -s ${SIZE}  $DIR/TR_${SIZE}.big
ls -lhR top/001/

