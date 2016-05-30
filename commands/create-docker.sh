#!/usr/bin/env bash
# @TODO: Create a script to rebuild the docker container
# @TODO: Add more volumes or just exclude the sites/default folder

# Create Docker container
echo -e ">> Create or Start container ${CONTAINER_NAME}."

CONTAINER_STATUS=$(docker inspect -f {{.State.Running}} "${CONTAINER_NAME}" 2> /dev/null)
CONTAINER_STARTED=$(docker inspect --format="{{ .State.StartedAt }}" "${CONTAINER_NAME}")

echo -e ">> CONTAINER_STATUS: ${CONTAINER_STATUS}"

if [[ "${CONTAINER_STATUS}" == "true" ]];
  then
    echo -e ">> ${CONTAINER_NAME} is already running, StartedAt ${CONTAINER_STARTED}, abording."
fi

if [[ "${CONTAINER_STATUS}" == "false" ]];
  then
    echo -e ">> ${CONTAINER_NAME} is not running starting it..."
    docker start "${CONTAINER_NAME}"
fi

if [[ -d "${PROJECT_PATH}"/profiles && $? -eq 1 ]]
  then
    docker pull "${DOCKER_IMAGE}"
    echo -e ">> ${CONTAINER_NAME} does not exist creating it..."
    docker run --name="${CONTAINER_NAME}" -t -d \
    -p "${DOCKER_PORT_HTTP}":80 \
    -p "${DOCKER_PORT_SSH}":22 \
    -v "${PROJECT_PATH}"/profiles:/var/www/profiles \
    --restart=always \
    "${DOCKER_IMAGE}"
  else
    docker pull "${DOCKER_IMAGE}"
    docker run --name="${CONTAINER_NAME}" -t -d \
    -p "${DOCKER_PORT_HTTP}":80 \
    -p "${DOCKER_PORT_SSH}":22 \
    --restart=always \
    "${DOCKER_IMAGE}"
fi

# Show current container urls
echo -e ">> Docker container related info \n"
echo -e ">> Container app url    : http://localhost:${DOCKER_PORT_HTTP}"
if [[ ${DOCKER_IMAGE} == dropdog/docker ]]
  then
    echo -e ">> Container phpmyadmin : http://localhost:${DOCKER_PORT_HTTP}/phpmyadmin \n"
fi

# Show Docker related commands
echo -e ">> Docker related commands \n"
echo -e ">> Show active containers: 'docker ps'"
echo -e ">> Inspect container     : 'docker inspect ${CONTAINER_NAME}'"
echo -e ">> Stop the container    : 'docker stop  ${CONTAINER_NAME}'"
echo -e ">> Start the container   : 'docker start ${CONTAINER_NAME}'"
echo -e ">> SSH into the container: 'docker exec -i -t ${CONTAINER_NAME} bash'"

# SSH into Docker container?
echo -e ">> SSH into Docker [y/N]? "
read -r DOCKER_SSH

if [[ ${DOCKER_SSH} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo ">> SSH into docker container ${CONTAINER_NAME}"
  docker exec -i -t "${CONTAINER_NAME}" bash
else
  echo -e "Aborting, goodbye."
  return
fi
