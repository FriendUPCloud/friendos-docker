# Use the official latest Ubuntu base image
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && \
	apt-get install -y software-properties-common \
		build-essential \
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
COPY ./assets/init-system.sh /docker-entrypoint-initdb.d/

# Expose port 6502 and 6205 for Friend Core https and wss
EXPOSE 6502
EXPOSE 6505

# Make the initialization script executable
RUN chmod +x /docker-entrypoint-initdb.d/init-system.sh

# Start the initialization script
CMD ["/docker-entrypoint-initdb.d/init-system.sh"]



