#!/bin/bash
set -e

# Clone the repository
if [ ! -f "Config" ]; then
	git clone https://github.com/FriendUPCloud/friendup/

	# Navigate into the repository directory
	cd friendup

	# Checkout the specific release branch
	git checkout release/1.3.0

	# Check if the Config file does not exist and create it with specific content
	if [ ! -f "Config" ]; then
		echo "USE_SSH_THREADS_LIB=0" >> Config
		echo "OPENSSL_INTERNAL=1" >> Config
		make clean setup
	fi
else
	cd friendup
fi

mkdir -p build
cp /tmp/site.ini build/

# Navigate back to the repository directory and build the project
make compile && make install

cd ..

