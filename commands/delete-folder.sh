#!/usr/bin/env bash
# Delete project folder

echo -n ">> Do you want to delete project folder (${PROJECT_PATH})? [Y/n]: "
read DELETE_FOLDER

if [[ ${DELETE_FOLDER} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo ">> Deleting ${PROJECT_PATH}"
  sudo rm -rf "${PROJECT_PATH}"
else
  echo -e ">> Aborting, continue."
  return
fi
