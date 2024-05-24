# Use the official latest Ubuntu base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
	apt-get install -y software-properties-common \
		build-essential \
		git \
		php7.4 \
		php7.4-mysqli \
		php7.4-gd \
		php7.4-zip \
		php7.4-curl \
		php7.4-readline \
		curl \
		wget \
		nano \
		bash \
		libssh2-1-dev \
		libssh-dev \
		libssl-dev \
		libaio-dev \
		libmysqlclient-dev \
		build-essential \
		libmatheval-dev \
		libmagic-dev \
		libgd-dev \
		libuv1 \
		rsync \
		valgrind-dbg \
		libxml2-dev \
		cmake \
		ssh \
		make \
		libsmbclient-dev \
		libwebsockets-dev \
		libsqlite3-dev && \
	apt-get clean

# Copy database and init script
COPY ./assets/init-system.sh /usr/local/bin/

COPY ./assets/site.ini /tmp/

WORKDIR /opt/

# Make the initialization script executable
RUN chmod +x /usr/local/bin/init-system.sh

# Expose port 6502 and 6205 for Friend Core https and wss
EXPOSE 6502
EXPOSE 6505

# Set the entry point to the initialization script
ENTRYPOINT ["/usr/local/bin/init-system.sh"]



