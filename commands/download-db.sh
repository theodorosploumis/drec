#!/usr/bin/env bash
# Download dump database

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

DATE=$(date +%Y%m%d-%H%M)

# Dump Structure
TABLES=$(mysql --skip-column-names -e 'show tables' -u ${MYSQL_USER} -p${MYSQL_PASS} -P ${MYSQL_PORT} ${DATABASE})
# test if connection was unsuccessful. If so, bail.
if [[ ${TABLES} == 0 ]]
then
  echo -e "${RED}>> Bad mysql connection info.${RESET}"
  exit 1
fi
# Continue of connection retrieved data, here, the schema
echo "${GREEN}Starting to dump the table structure.${RESET}"
mysqldump --complete-insert --disable-keys --single-transaction --no-data -u ${MYSQL_USER} --password=${MYSQL_PASS} -P ${MYSQL_PORT} ${DATABASE} ${TABLES} > "${DATABASE}.${DATE}".sql

# Dump Data, Excluding Certain Tables
echo "${GREEN}Starting to dump the table data.${RESET}"

echo "${GREEN}Dumping Drupal 8.x tables.${RESET}"|
XTABLES=$(echo "$TABLES" | grep -Ev "^(cache.*|sessions|watchdog)$")

mysqldump --complete-insert --disable-keys --single-transaction --no-create-info -u ${MYSQL_USER} --password=${MYSQL_PASS} -P ${MYSQL_PORT} ${XTABLES} >> "${DATABASE}.${DATE}".sql

# Gzip files
#echo "${MAG}Starting to gzip dump.${RESET}"
#echo "${GREEN}"
#gzip -v "${DB}.${DATE}".sql
echo "${RESET}"
