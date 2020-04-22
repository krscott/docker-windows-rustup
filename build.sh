#!bash

# exit when any command fails
set -e
trap 'echo ''; echo Error at $(basename "$0"):${LINENO}: $BASH_COMMAND' ERR

# set working directory to this script's directory
cd "${0%/*}"

unix2dospath() {
    echo $(realpath "$1") | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/'
}

# Target directory of exe output on host machine
HOST_BUILD_DIR="target"

# The starting vstools docker image tag
PARENT_IMAGE="windows-rust"

# The project docker image tag
PROJ_IMAGE="rust-builder"


mkdir -p "$HOST_BUILD_DIR"

docker build -t $PARENT_IMAGE lib/$PARENT_IMAGE
# docker run -it --rm --entrypoint cmd $PARENT_IMAGE

docker build -t $PROJ_IMAGE .
# docker run -it --rm --entrypoint cmd $PROJ_IMAGE
docker run -v "$(unix2dospath "$HOST_BUILD_DIR")":'C:\mount' --rm \
    --entrypoint cmd $PROJ_IMAGE '//c' \
    'robocopy C:\proj\target C:\mount /MIR /copy:dat || rem'