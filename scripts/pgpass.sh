#!/bin/sh
set -e

if [ ! -z "$POSTGRES_PASSWORD_FILE" ]
then
  export PGPASSWORD="`cat ${POSTGRES_PASSWORD}`"
else
  export PGPASSWORD="${POSTGRES_PASSWORD}"
fi

exec "$@"