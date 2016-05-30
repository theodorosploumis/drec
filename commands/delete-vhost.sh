#!/usr/bin/env bash
# Delete vhost

echo -n ">> Do you want to delete vhost ${VHOST}? [Y/n]: "
read DELETE_VHOST

if [[ ${DELETE_VHOST} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo ">> Delete the vhost of ${VHOST}"
  sudo virtualhost delete ${VHOST}
else
  echo -e ">> Aborting, continue."
  return
fi
