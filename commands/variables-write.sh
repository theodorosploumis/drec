#!/usr/bin/env bash
# Write variables on a settings file

if [ ! -e "${PROJECT_SETTINGS}" ]
then
  #create a new file
  sudo touch "${PROJECT_SETTINGS}"
  sudo chown $USER:$USER "${PROJECT_SETTINGS}"
else
  # Clear the file content
  truncate -s 0 "${PROJECT_SETTINGS}"
fi

if [ ! -w "${PROJECT_SETTINGS}" ] ; then
  echo -e ">> Cannot write to ${PROJECT_SETTINGS}. Abording"
  return
fi

VARIABLES="PROJECT_TITLE=\"${PROJECT_TITLE}\"\n\
DRUPAL_VERSION=\"${DRUPAL_VERSION}\"\n\
REPO=\"${REPO}\"\n\
ROOT=\"${ROOT}\"\n\
PROFILE=\"${PROFILE}\"\n\
BRANCH=\"${BRANCH}\"\n\
DOMAIN=\"${DOMAIN}\"\n\
PROJECT_PATH=\"${PROJECT_PATH}\"\n\
DOCKER_PORT_HTTP=\"${DOCKER_PORT_HTTP}\"\n\
DOCKER_PORT_SSH=\"${DOCKER_PORT_SSH}\"\n\
DOCKER_IMAGE=\"${DOCKER_IMAGE}\"\n\
CONTAINER_NAME=\"${CONTAINER_NAME}\"\n\
DATABASE=\"${DATABASE}\"\n\
VHOST=\"${VHOST}\"\n\
MYSQL_USER=\"${MYSQL_USER}\"\n\
MYSQL_PASS=\"${MYSQL_PASS}\"\n\
MYSQL_PORT=\"${MYSQL_PORT}\"\n\
SETTINGS_FILE=\"${SETTINGS_FILE}\"\n\
PROJECT_SETTINGS=\"${PROJECT_SETTINGS}\""
echo "${VARIABLES}" >> "${PROJECT_SETTINGS}"

echo -e ">> Project settings saved to ${PROJECT_SETTINGS}."
