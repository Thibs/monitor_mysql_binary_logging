# monitor_mysql_binary_logging
Shell script to automatically purge MySQL binaries logs

This script is designed to be run by cron every X minutes
e.g. :
`*/5 * * * * /root/scripts/monitor_mysql_binary_logging.sh >/dev/null`

Adapt with your settings

- `export MYSQL_PWD=XXXXXXX
`
WHERE XXXXXXX is your MySQL root password

- `FOLDER2MONITOR=/srv/log/mysql/
`
WHERE FOLDER2MONITOR is the location with your MySQL binary logs. It should ideally be a dedicated partition

- `MAXPERCENTAGE2USE=79
` WHERE 79 is the max used size percentage of the partition containing your MySQL binary logs.

- `MINIMUMBINLOG2KEEP=5`
WHERE 5 is the minimum number of binary log files yoy want to keep. MAXPERCENTAGE2USE is overwritten by this setting
