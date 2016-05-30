#!/usr/bin/env bash
# Remove Docker container

# Delete Docker container?
echo -e ">> Do you want to remove Docker container ${CONTAINER_NAME}? [y/N]: "
read -r DOCKER_DELETE

if [[ ${DOCKER_DELETE} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo ">> Stopping and removing docker container ${CONTAINER_NAME}"
  docker stop "${CONTAINER_NAME}"
  docker rm "${CONTAINER_NAME}"
else
  echo -e "Aborting."
  return
fi
