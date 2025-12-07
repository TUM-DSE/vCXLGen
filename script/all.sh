set -eo pipefail


SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


"$SCRIPT_DIR/build-gem5.sh"


"$SCRIPT_DIR/build-benchmark-x86.sh"


"$SCRIPT_DIR/create-conf.sh"


"$SCRIPT_DIR/run.sh"


"$SCRIPT_DIR/plot.sh"
