#!/usr/bin/env bash
# Create a new database or clear if exists

# Create the database
echo -e ">> Create database ${DATABASE}"
mysql -u "${MYSQL_USER}" -p"${MYSQL_PASS}" -e "CREATE DATABASE ${DATABASE} CHARACTER SET utf8 COLLATE utf8_general_ci"
