#!/usr/bin/env bash
# Install a new Drupal site

echo -e ">> Installing Drupal..."

cd "${PROJECT_PATH}"
drush site-install -y "${PROFILE}" \
                  --db-url=mysql://"${MYSQL_USER}":"${MYSQL_PASS}"@localhost:"${MYSQL_PORT}"/${DATABASE} \
                  --site-name=${PROFILE}-${NOW} \
                  --account-name=admin \
                  --account-pass=admin \
                  --notify

google-chrome http://localhost/"${VHOST}"
google-chrome http:"${VHOST}"