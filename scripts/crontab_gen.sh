#!/bin/sh
#set -e

echo "${CRON_RUN_MINUTE-0} ${CRON_RUN_HOUR-0} * * * /pgpass.sh /pg_backup_rotate.sh" >/etc/crontabs/root
