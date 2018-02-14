#!/bin/sh
set -e

/crontab_gen.sh

/config_gen.sh

exec "$@"
