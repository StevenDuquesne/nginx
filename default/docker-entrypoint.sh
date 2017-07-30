#!/usr/bin/env bash

if [ -n "$USERID" ]; then
    WWWUID="$(id -u www-data)"
    WWWGID="$(id -g www-data)"

    if [ "$WWWUID" != "$USERID" ]; then
        usermod -u ${USERID} www-data && \
        groupmod -g ${USERID} www-data && \
        find /etc/ -user ${WWWUID} -exec chown -h ${USERID} {} \; && \
        find /var/ -user ${WWWUID} -exec chown -h ${USERID} {} \; && \
        find /etc/ -group ${WWWGID} -exec chgrp -h ${USERID} {} \; && \
        find /var/ -group ${WWWGID} -exec chgrp -h ${USERID} {} \;
    fi
fi

set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

exec "$@"