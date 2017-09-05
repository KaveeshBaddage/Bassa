FROM beevelop/nodejs:6

# File Author / Maintainer
MAINTAINER KaveeshBaddage

# Update the sources list
RUN apt-get update -y;


# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python python3-dev python-distribute python-pip libmysqlclient-dev

RUN mkdir -p /usr/src/app

# Set the default directory where CMD will execute
WORKDIR /usr/src/app

# Copy the application folder inside the container
COPY . /usr/src/app

COPY requirements.txt /usr/src/app

# Get pip to download and install requirements:
RUN pip install -r requirements.txt

# Expose ports
EXPOSE 4000



#install gulp 
RUN npm install --global bower
RUN npm install --global gulp
RUN npm i gulp


# Set the default command to execute    
# when creating a new container
# i.e. using CherryPy to serve the application
CMD gulp serve 
