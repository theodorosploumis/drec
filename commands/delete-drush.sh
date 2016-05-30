#!/usr/bin/env bash
# Delete a Drush alias file

echo -n ">> Do you want to delete drush alias @${SETTINGS_FILE}? [Y/n]: "
read DELETE_DRUSH

if [[ ${DELETE_DRUSH} =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    if [[ -e $HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php ]];
      then
        rm -f "$HOME/.drush/${SETTINGS_FILE}.alias.drushrc.php"
    fi
  else echo -e ">> No drush alias found with name @${SETTINGS_FILE}. Abording."
fi
