# docker-pg_backup
Docker container with pg_backup_rotated.sh script from https://wiki.postgresql.org/wiki/Automated_Backup_on_Linux
This image runs pg_backup_rotated.sh daily via cron at configurable time. pg_backup_rotated.sh produces backups of various configurable formats and rotates weekly and daily backups.

Docker environment variables:
 - POSTGRES_HOSTNAME - ip/hostname of postgres server
 - POSTGRES_USER - user to connect as ('postgres' by default)
 - POSTGRES_PASSWORD - password of POSTGRES_USER
 - POSTGRES_PASSWORD_FILE - location of file containing password of POSTGRES_USER (can be /run/secrets/SECRETNAME if you put password in SECRETNAME)
 - CRON_RUN_MINUTE, CRON_RUN_HOUR - run backups daily at this time every day
 - WEEKS_TO_KEEP - how many weeks to keep weekly backups (default 5)
 - DAYS_TO_KEEP - number of days to keep daily backups (default 7)
 - DAY_OF_WEEK_TO_KEEP - which day to take the weekly backup from (1-7 = Monday-Sunday, default 5-Friday)
 - ENABLE_GLOBALS_BACKUPS - will produce gzipped sql file containing the cluster globals, like users and passwords, if set to "yes" (default)
 - ENABLE_PLAIN_BACKUPS - will produce a gzipped plain-format backup if set to "yes" (default)
 - ENABLE_CUSTOM_BACKUPS - will produce a custom-format backup if set to "yes" (default)
 - SCHEMA_ONLY_LIST - List of strings to match against in database name, separated by space or comma, for which we only wish to keep a backup of the schema, not the data. Any database names which contain any of these values will be considered candidates. (e.g. "system_log" will match "dev_system_log_2010-01"). Default is empty list.
 
Volumes:
 - /backups - backups go there

The backup script code is taken as-is from postgress wiki, I am not sure which license is it, I claim no rights to this code.
Configuration script is based on config file from postgres wiki. The code that is written by me is in the public domain (CC0). 
