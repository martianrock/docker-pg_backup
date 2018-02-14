# docker-pg_backup
Docker container with pg_backup script from https://wiki.postgresql.org/wiki/Automated_Backup_on_Linux
This image runs pg_backup_rotated.sh daily via cron at configurable time.

Environment:
 - POSTGRES_HOSTNAME - ip/hostname of postgres server
 - POSTGRES_USER - user to connect as ('postgres' by default)
 - POSTGRES_PASSWORD - password of POSTGRES_USER
 - POSTGRES_PASSWORD_FILE - location of file containing password of POSTGRES_USER (can be /run/secrets/SECRETNAME if you put password in SECRETNAME)
 - CRON_RUN_MINUTE, CRON_RUN_HOUR - run backups daily at this time every day

Volumes:
 - /backups - backups go there

The backup script code is taken as is from postgress wiki, I am not sure which license is it, I claim no rights to this code.
The code that is written by me is in the public domain (CC0). 