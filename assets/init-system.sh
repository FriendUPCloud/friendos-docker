#!/bin/bash
set -e

cd /opt/friendup

# Check if the build directory exists, if not, create and build
if [ ! -d "build" ]; then
    mkdir -p build
    cp /tmp/site.ini build/
    make compile && make install
else
    echo "Build directory already exists. Skipping build."
fi

# Start any required services or further initialization here

exec "$@"

