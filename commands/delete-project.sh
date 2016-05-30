#!/usr/bin/env bash
# Delete project settings

if [[ $1 && -z $2 ]]
  then
    echo -e ">> No .drecfile provided. Abording."
    exit 1;
fi

# Source existing scripts
source "${DIR_COMMANDS}"/delete-docker.sh
source "${DIR_COMMANDS}"/delete-vhost.sh
source "${DIR_COMMANDS}"/delete-db.sh
source "${DIR_COMMANDS}"/delete-folder.sh
source "${DIR_COMMANDS}"/delete-drush.sh

if [[ ${REMOVE_SETTINGS} =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    rm "${PROJECT_SETTINGS}"
    echo -e ">> ${PROJECT_SETTINGS} removed."
  else
    echo -e ">> Settings file ${PROJECT_SETTINGS} not deleted. Abording."
fi


# Remove Project settings file
echo -n ">> Do you want to remove project settings file? [Y/n]: "
read REMOVE_SETTINGS

if [[ ${REMOVE_SETTINGS} =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    rm -f "${PROJECT_SETTINGS}"
    echo -e ">> ${PROJECT_SETTINGS} removed."
  else
    echo -e ">> Settings file ${PROJECT_SETTINGS} not deleted. Abording."
fi

# Go to ROOT
ls -l ${ROOT}
