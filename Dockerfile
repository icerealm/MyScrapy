FROM ubuntu
LABEL maintainer="jakkrit.sittiwerapong"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --assume-yes apt-utils

# python installation
RUN apt-get install -qy python3 python3-dev python-distribute \
 python3-pip python3-scipy python3-numpy python3-lxml ipython
RUN pip3 install --upgrade pip
# Scraping tools
RUN pip3 install beautifulsoup4 requests 
RUN apt-get install -qy libffi-dev libxml2-dev libxslt-dev lib32z1-dev libssl-dev

# Scrapy install
RUN pip3 install lxml scrapy scrapyjs scrapy-splash