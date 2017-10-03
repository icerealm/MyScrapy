#!/bin/sh

if [ -d "$1" ]; then
    echo "executing docker run"
    docker run --name my-scrapy -v $1:/opt/dev -t -d scrapy
else
    echo "$1 does not exist"
fi