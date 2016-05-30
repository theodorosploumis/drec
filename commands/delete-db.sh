#!/usr/bin/env bash
# Delete the database
# TODO: find the database of current Drupal site

echo -e ">> Do you want to delete database ${DATABASE}? [Y/n]: "
read DELETE_DB

# Enable or abort
if [[ ${DELETE_DB} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo -e ">> Deleting database ${DATABASE}"
  mysql -u "${MYSQL_USER}" -p"${MYSQL_PASS}" --port="${MYSQL_PORT}" -e "DROP DATABASE IF EXISTS ${DATABASE}"
else
  echo -e ">> Aborting, continue."
  return
fi

# drupalconsole alternative
# That cleans a database without dropping
#cd ${PROJECT_PATH} && drupal database:drop -y
