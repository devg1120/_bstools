
GREP_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
bash $GREP_SCRIPT_DIR/grep_dir.sh $1 unit  $2

