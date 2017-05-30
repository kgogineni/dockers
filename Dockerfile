
FROM ubuntu:14.04

MAINTAINER Krishnaiah Gogineni <krishna.gogineni@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
ENV PYTHON_VERSION 2.7.13

#ONBUILD ARG dir
#ONBUILD ENV dir ${dir:- /opt/}

#ONBUILD RUN echo Configure installation dir : $dir

#ONBUILD ARG app
#ONBUILD ENV app ${app:- app}

#ONBUILD RUN echo Configure application name : $app

RUN apt-get -y -q update

RUN apt-get -q --force-yes install -y \
    wget ntp build-essential python-setuptools

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
#RUN apt-get purge -y --auto-remove

#Lets install the app now...
#RUN mkdir -p $dir/$app


#ONBUILD WORKDIR $dir/$app/

#ONBUILD RUN echo application is being installed at : $dir/$app/

#ONBUILD COPY ./ $dir/$app/

#ONBUILD RUN pip install --no-cache-dir -r requirements.txt
