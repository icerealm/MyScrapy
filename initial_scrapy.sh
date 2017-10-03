#!/bin/sh

docker=`which docker`
image_name=`$docker images | grep scrapy | awk '{print $1}'`

if [ ${#image_name} -gt 0 ]; then
    if [ -d "$1" ]; then
        echo "executing docker run"
        docker run --name my-scrapy -v $1:/opt/dev -t -d scrapy
    else
        echo "please specify your local directory. \nEg) ./initial_scrapy.sh <your_local_dir>"
    fi
else
    echo "there is no scrapy image in your system, please run 'docker build -t scrapy .'"
fi