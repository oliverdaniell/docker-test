FROM ubuntu:18.04
MAINTAINER Oliver Daniell <oliver.daniell@veracityuk.com>

# Install dependencies.
RUN	apt-get update && apt-get install -y build-essential \
    gperf bison flex texinfo wget gawk libtool-bin automake \
    libncurses5-dev help2man ca-certificates git python python-dev \
    unzip nano

# Download and compile crosstool-NG.
RUN	git clone --single-branch --branch crosstool-ng-1.24.0 https://github.com/crosstool-ng/crosstool-ng.git  &&\
     cd crosstool-ng &&\
    ./bootstrap &&\
    ./configure && make && make install &&\
    cd ../ && rm -rf crossrool-ng
 
RUN adduser crosstool
USER crosstool
WORKDIR /home/crosstool
