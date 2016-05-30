#!/usr/bin/env bash
# Initial setup of variables

# Set colors using tput (http://linuxcommand.org/lc3_adv_tput.php)
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"

################################ General info ##################################

# Project title
# Default
PROJECT_TITLE=drec-$(cat /dev/urandom | tr -dc '0-9' | fold -w 3 | head -n 1)

# User input
echo -n "${GREEN}>> Enter a decriptive Project Title or press enter for default (${PROJECT_TITLE}): ${RESET}"
read -r READ_PROJECT_TITLE

# Clone new title
if [[ "${READ_PROJECT_TITLE}" ]]
then
  PROJECT_TITLE="${READ_PROJECT_TITLE}"
else
  echo -n ">> Using default value, continue.\n"
fi

export PROJECT_TITLE

################################ Drupal version ##################################

# Drupal version
# Default
DRUPAL_VERSION=8.1.1

# User input
echo -n "${GREEN}>> Enter Drupal version or press enter for default (${DRUPAL_VERSION}): ${RESET}"
read -r READ_DRUPAL_VERSION

if [[ "${READ_DRUPAL_VERSION}" ]]
then
  DRUPAL_VERSION="${READ_DRUPAL_VERSION}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DRUPAL_VERSION

################################ Git repository ################################

# Git repository
# User input
echo -n "${GREEN}>> Enter Git Repository or press enter for default (${REPO}): ${RESET}"
read -r READ_REPO

# Clone new git repo
if [[ "${READ_REPO}" ]]
then
  REPO="${READ_REPO}"
else
  echo -n ">> Using default value, continue.\n"
fi

export REPO

# Enter branch repository
# User input
echo -n "${GREEN}>> Enter Git Branch or press enter for default (${BRANCH}): ${RESET}"
read -r READ_BRANCH

# Set new branch
if [[ "${READ_BRANCH}" ]]
then
  BRANCH="${READ_BRANCH}"
else
  echo -n ">> Using default value, continue.\n"
fi

export BRANCH

################################ Drupal ########################################

# Enter Drupal profile
# User input
echo -n "${GREEN}>> Enter Drupal profile or press enter for default (${PROFILE}): ${RESET}"
read -r READ_PROFILE

# Set new profile
if [[ "${READ_PROFILE}" ]]
then
  PROFILE="${READ_PROFILE}"
else
  echo -n ">> Using default value, continue.\n"
fi

export PROFILE

################################ Project paths #################################
# Root
# User input
echo -n "${GREEN}>> Enter the root path or press enter for default (${ROOT}): ${RESET}"
read -r READ_ROOT

# Set root path
if [[ "${READ_ROOT}" ]]
then
  # Set new root
  ROOT="${READ_ROOT}"
else
  echo -n ">> Using default value, continue.\n"
fi

export ROOT

# Local domain (usually used as a vhost alias)
# Default
DOMAIN="${PROFILE}"-$(cat /dev/urandom | tr -dc '0-9' | fold -w 3 | head -n 1).local

# User input
echo -n "${GREEN}>> Enter Domain or press enter for random (${DOMAIN}): ${RESET}"
read -r READ_DOMAIN

# Set new domain name
if [[ "${READ_DOMAIN}" ]]
then
  DOMAIN="${READ_DOMAIN}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DOMAIN

# Project path
PROJECT_PATH="${ROOT}/${DOMAIN}"
export PROJECT_PATH

# Vhost
VHOST="${DOMAIN}"
export VHOST

################################ Project settings ##############################

# Default
SETTINGS_FILE=`echo "${DOMAIN}" | sed 's/[^a-zA-Z0-9]*//g'`
PROJECT_SETTINGS="$HOME/.drec/${SETTINGS_FILE}.drecfile"

# User input
echo -n "${GREEN}>> Enter Settings file name (without the extension '.drecfile') or press enter for default (${SETTINGS_FILE}) :${RESET}"
read -r READ_SETTINGS_FILE

if [[ "${READ_SETTINGS_FILE}" && ! -e "$HOME/.drec/${READ_SETTINGS_FILE}.drecfile" ]]
then
  PROJECT_SETTINGS="$HOME/.drec/${READ_SETTINGS_FILE}"
else
  echo -n ">> Using default value, continue.\n"
fi

export PROJECT_SETTINGS

################################ Database ######################################

# Default values
DATABASE=`echo ${DOMAIN}${PROFILE} | sed 's/[^a-zA-Z0-9]*//g'`

echo -n "${GREEN}>> Enter local mysql Database NAME or press enter for default (${DATABASE}): ${RESET}"
read -r READ_DATABASE

# Set default or custom
if [[ "${READ_DATABASE}" ]]
then
  DATABASE="${READ_DATABASE}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DATABASE

# Database user
echo -n "${GREEN}>> Enter local mysql Database USER or press enter for default (${MYSQL_USER}): ${RESET}"
read -r READ_MYSQL_USER

# Set default or custom
if [[ "${READ_MYSQL_USER}" ]]
then
  MYSQL_USER="${READ_MYSQL_USER}"
else
  echo -n ">> Using default value, continue.\n"
fi

export MYSQL_USER

# Database pass
echo -n "${GREEN}>> Enter local mysql Database PASS or press enter for default (${MYSQL_PASS}): ${RESET}"
read -r READ_MYSQL_PASS

# Set default or custom
if [[ "${READ_MYSQL_PASS}" ]]
then
  MYSQL_PASS="${READ_MYSQL_PASS}"
else
  echo -n ">> Using default value, continue.\n"
fi

export MYSQL_PASS

# Database mysql port
echo -n "${GREEN}>> Enter local mysql Database PORT or press enter for default (${MYSQL_PORT}): ${RESET}"
read -r READ_MYSQL_PORT

# Set default or custom
if [[ "${READ_MYSQL_PORT}" ]]
then
  MYSQL_PORT="${READ_MYSQL_PORT}"
else
  echo -n ">> Using default value, continue.\n"
fi

export MYSQL_PORT

################################ Docker ########################################

# Default values
DOCKER_PORT_HTTP="80"$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)

# Docker host http port
echo -n "${GREEN}>> Docker host http port or press enter for random (${DOCKER_PORT_HTTP}): ${RESET}"
read -r READ_DOCKER_PORT_HTTP

# Set default or custom http port
if [[ "${READ_DOCKER_PORT_HTTP}" ]]
then
  DOCKER_PORT_HTTP="${READ_DOCKER_PORT_HTTP}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DOCKER_PORT_HTTP

# Docker host http port
# Default
DOCKER_PORT_SSH="80"$(cat /dev/urandom | tr -dc '0-9' | fold -w 2 | head -n 1)

# User input
echo -n "${GREEN}>> Docker host http port or press enter for random (${DOCKER_PORT_SSH}): ${RESET}"
read -r READ_DOCKER_PORT_SSH

# Set default or custom http port
if [[ "${READ_DOCKER_PORT_SSH}" ]]
then
  DOCKER_PORT_SSH="${READ_DOCKER_PORT_SSH}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DOCKER_PORT_SSH

# Docker Container name
# Default
CONTAINER_NAME=${PROFILE}_${DOCKER_PORT_HTTP}_${DOCKER_PORT_SSH}

# User input
echo -n "${GREEN}>> Enter Docker Container name or press enter for default (${CONTAINER_NAME}): ${RESET}"
read -r READ_CONTAINER_NAME

# Set default or custom container name
if [[ "${READ_CONTAINER_NAME}" ]]
then
  CONTAINER_NAME="${READ_CONTAINER_NAME}"
else
  echo -n ">> Using default value, continue.\n"
fi

export CONTAINER_NAME

# Enter Docker build/repository
# User input
echo -n "${GREEN}>> Enter Docker image or press enter for default (${DOCKER_IMAGE}): ${RESET}"
read -r READ_DOCKER_IMAGE

if [[ "${READ_DOCKER_IMAGE}" ]]
then
  DOCKER_IMAGE="${READ_DOCKER_IMAGE}"
else
  echo -n ">> Using default value, continue.\n"
fi

export DOCKER_IMAGE
