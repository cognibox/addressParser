#FROM ubuntu:latest
FROM python:3.9.7-slim
USER root
ARG DEBIAN_FRONTEND=noninteractive
# LIBPOSTAL
# Install Libpostal dependencies
RUN apt-get update && \
	apt-get install -y \
		make \
		curl \
		autoconf \
		automake \
		libtool \
		pkg-config \
		python3-pip

# Download libpostal source to /usr/local/libpostal-1.1-alpha
RUN cd /usr/local && curl -sL https://github.com/openvenues/libpostal/archive/v1.1-alpha.tar.gz | tar -xz


# Create Libpostal data directory at /var/libpostal/data
RUN cd /var && \
	mkdir libpostal && \
	cd libpostal && \
	mkdir data

# Install Libpostal from source
RUN cd /usr/local/libpostal-1.1-alpha && \
	./bootstrap.sh && \
	./configure --datadir=/var/libpostal/data && \
	make -j4 && \
	make install && \
	ldconfig


# Install Libpostal python Bindings
RUN pip3 install postal
# install dependencies
RUN pip install --no-cache-dir --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# create directory for the script
RUN mkdir -p /home/script

# create the app user
RUN addgroup --system script && adduser --system --ingroup script script

# create the appropriate directories
ENV HOME=/home/script
WORKDIR $HOME

# copy project
COPY . $HOME
RUN mkdir $HOME/data
RUN chown -R script:script $HOME
VOLUME $HOME/data
# chown all the files to the app user

# change to the app user
USER script
ENTRYPOINT ["python3", "main.py"]
