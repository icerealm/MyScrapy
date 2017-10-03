#!/bin/sh

docker=`which docker`
instance=`$docker ps -a|grep my-scrapy`
command=$1

if [ ${#instance} -gt 0 ]; then
    echo 'running... docker' $command 'my-scrapy'
    echo `docker $command my-scrapy`
else
    echo "There is no my-scrapy instance, please install and run initial_scrapy for initialization."
fi
