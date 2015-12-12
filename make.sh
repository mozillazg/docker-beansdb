#!/bin/bash
set -e

if [ "$1" = 'build' ]; then
    docker build -t mozillazg/beansdb:$2 $2
elif [ "$1" = 'run' ]; then
    docker run -i -t mozillazg/beansdb:$2
elif [ "$1" = 'push' ]; then
    docker push mozillazg/beansdb
fi
