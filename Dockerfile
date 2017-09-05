# Set the base image to Ubuntu
FROM ubuntu:latest

# File Author / Maintainer
MAINTAINER KaveeshBaddage

# Update the sources list
RUN apt-get update -y

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python3 python3-dev python-distribute python3-pip libmysqlclient-dev

RUN mkdir -p /usr/src/app

# Set the default directory where CMD will execute
WORKDIR /usr/src/app

RUN apt-get -yqq install python-flask

# Copy the application folder inside the container
ADD . /usr/src/app

# Get pip to download and install requirements:
RUN pip3 install -r requirements.txt

COPY . /usr/src/app

# Expose ports
EXPOSE 3000


# Set the default command to execute    
CMD cd ./components/core;python3 setup.py develop && python3 Main.py
