#!/bin/sh
set -e

echo 15000 > /proc/sys/user/max_user_namespaces

gosu jenkins jenkins-agent "$@"
