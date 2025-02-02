#!/bin/bash
set -ex

# set up
PROJECT=utf8
GROUP=rphii

# make sure all variables are set
if [[ -z "${CC}" ]]; then
    echo "CC= (c compiler) is empty!" 1>&2
    exit -1
fi

# compile
mkdir -p build/{32,64} || true
$CC -Wall -Wextra $CFLAGS -o "build/32/lib${PROJECT}.so" -m32 src/*.c -shared -fPIC &
$CC -Wall -Wextra $CFLAGS -o "build/64/lib${PROJECT}.so" -m64 src/*.c -shared -fPIC &

wait

