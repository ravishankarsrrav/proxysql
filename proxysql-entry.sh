#!/bin/bash
if [ -z "$PROXY_ADMIN_PASSWORD" ]; then
        echo >&2 'Error:  You need to specify PROXY_ADMIN_PASSWORD'
        exit 1
fi

if [ -z "$MYSQL_HOST" ]; then
        echo >&2 'Error:  You need to specify MYSQL_HOST'
        exit 1
fi

if [ -z "$MYSQL_USER" ]; then
        echo >&2 'Error:  You need to specify MYSQL_USER'
        exit 1
fi

if [ -z "$MYSQL_USER_PASSWORD" ]; then
        echo >&2 'Error:  You need to specify MYSQL_USER_PASSWORD'
        exit 1
fi

awk '{sub(/PROXY_ADMIN_PASSWORD/,"'"$PROXY_ADMIN_PASSWORD"'")}1 {sub(/MYSQL_HOST/,"'"$MYSQL_HOST"'")}1 {sub(/MYSQL_USER_PASSWORD/,"'"$MYSQL_USER_PASSWORD"'")}1 {sub(/MYSQL_USER/,"'"$MYSQL_USER"'")}1' /etc/proxysql.cnf > /etc/temp.cnf && mv /etc/temp.cnf /etc/proxysql.cnf
/usr/bin/proxysql --initial -f -c /etc/proxysql.cnf

