#!/usr/bin/env bash
# Create a Drush alias file

echo -e ">> Creating drush alias @${SETTINGS_FILE}."

if [[ ! -e $HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php ]];
  then
    #create a new file
    touch "$HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php"
    chown $USER:$USER "$HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php"
  else
    # Clear the file content
    truncate -s 0 "$HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php"
fi

SITE_ALIAS="$(drush site-alias \
            --show-passwords --with-db --show-passwords --show-hidden \
            --format=config \
            @self)"

cd "${PROJECT_PATH}" && \
    echo "${SITE_ALIAS}" >> "$HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php"


sed -i 's/self/'"${SETTINGS_FILE}"'/g' $HOME/.drush/"${SETTINGS_FILE}".alias.drushrc.php
