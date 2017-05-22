
FROM ubuntu:14.04

MAINTAINER Krishnaiah Gogineni <krishna.gogineni@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHON_VERSION 2.7.13

ARG dir
ENV dir ${dir:- /opt/}

RUN echo Configure installation dir : $dir

ARG app
ENV app ${app:- app}

RUN echo Configure application name : $app

RUN apt-get -y -q update

RUN apt-get -q --force-yes install -y \
    wget ntp build-essential checkinstall \
    libffi-dev libssl-dev python-dev \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
    python-setuptools

RUN easy_install pip
RUN pip --no-cache-dir install virtualenv

RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -P /opt/
WORKDIR /opt/
RUN tar -xzf Python-$PYTHON_VERSION.tgz \
    && cd Python-2.7.13 \
    && sudo ./configure --enable-unicode=ucs4 \
    && sudo make install \
    && sudo make altinstall

#Clean up all the unnecessary files
#RUN rm -rf /opt/Python*
RUN apt-get purge -y --auto-remove

#Lets install the app now...
RUN mkdir -p $dir/$app


WORKDIR $dir/$app/

RUN echo application is being installed at : $dir/$app/

ONBUILD COPY ./ $dir/$app/

ONBUILD RUN pip install --no-cache-dir -r requirements.txt
