#!/bin/bash
set -e

cd /opt/friendup/build

ls cfg/

#tail -f /opt/friendup/build/cfg/cfg.ini

exec "./FriendCore"

