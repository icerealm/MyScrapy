#!/bin/sh

docker=`which docker`
image_name=`$docker images | grep myscrapy | awk '{print $1}'`

if [ ${#image_name} -gt 0 ]; then
    if [ -d "$1" ]; then
        echo "executing docker run"
        docker run --name my-scrapy -v $1:/opt/dev -t -d myscrapy
    else
        echo "please specify your local directory that to be mounted to container folder. \nEg) ./initial_scrapy.sh <your_local_dir>"
    fi
else
    echo "There is no scrapy image in your system, create image by run 'docker build -t myscrapy .'"
fi