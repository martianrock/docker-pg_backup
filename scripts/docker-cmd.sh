#!/bin/sh
set -e

crond -s /etc/crontabs -f "$@"