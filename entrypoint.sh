#!/bin/sh

cat /app/conf/crontab > /var/spool/cron/crontabs/root

crond -f