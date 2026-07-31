


TARGET_DIR="./src"
BEFORE="mxgraph"
AFTER="gsdraw"
find ${TARGET_DIR}  -type f | xargs sed -i  "s/${BEFORE}/${AFTER}/g"

TARGET_DIR="./src"
BEFORE="mx"
AFTER="gs"
find ${TARGET_DIR}  -type f | xargs sed -i  "s/${BEFORE}/${AFTER}/g"


TARGET_DIR="./src"
B="mx"
A="gs"
tree ${TARGET_DIR}  
find ${TARGET_DIR}  -type f -name "*${B}*"  | sed "p;s/${B}/${A}/" | paste - - | xargs -n 2 mv -n
tree ${TARGET_DIR}  

TARGET_FILE="./vite.config.js"
BEFORE="mxgraph"
AFTER="gsdraw"
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}

TARGET_DIR="./examples"
BEFORE="mxgraph"
AFTER="gsdraw"
find ${TARGET_DIR}  -type f | xargs sed -i  "s/${BEFORE}/${AFTER}/g"

BEFORE="mx"
AFTER="gs"
find ${TARGET_DIR}  -type f | xargs sed -i  "s/${BEFORE}/${AFTER}/g"

TARGET_FILE="./index.html"
BEFORE="mxGraph"
AFTER="gsDraw"
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}

BEFORE="mx"
AFTER="gs"
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}

TARGET_FILE="./package.json"
BEFORE="mx"
AFTER="gs"
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}



TARGET_FILE="./Drawing.xml"
BEFORE="mxGraph"
AFTER="gsDraw"
sed -i  "s/${BEFORE}/${AFTER}/g" ${TARGET_FILE}



