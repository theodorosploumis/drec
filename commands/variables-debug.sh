#!/usr/bin/env bash
# Report on the CLI

RED="$(tput setaf 7 && tput setab 1)"
RESET="$(tput sgr0)"

# Debug variables' values
echo -e ">> Variables values following: \n"

echo -e ">> PROJECT_TITLE    = ${RED}${PROJECT_TITLE}${RESET}"
echo -e ">> DRUPAL_VERSION   = ${RED}${DRUPAL_VERSION}${RESET}"
echo -e ">> REPO             = ${RED}${REPO}${RESET}"
echo -e ">> ROOT             = ${RED}${ROOT}${RESET}"
echo -e ">> PROFILE          = ${RED}${PROFILE}${RESET}"
echo -e ">> BRANCH           = ${RED}${BRANCH}${RESET}"
echo -e ">> DOMAIN           = ${RED}${DOMAIN}${RESET}"
echo -e ">> PROJECT_PATH     = ${RED}${PROJECT_PATH}${RESET}"
echo -e ">> DOCKER_PORT_HTTP = ${RED}${DOCKER_PORT_HTTP}${RESET}"
echo -e ">> DOCKER_PORT_SSH  = ${RED}${DOCKER_PORT_SSH}${RESET}"
echo -e ">> DOCKER_IMAGE     = ${RED}${DOCKER_IMAGE}${RESET}"
echo -e ">> CONTAINER_NAME   = ${RED}${CONTAINER_NAME}${RESET}"
echo -e ">> DATABASE         = ${RED}${DATABASE}${RESET}"
echo -e ">> VHOST            = ${RED}${VHOST}${RESET}"
echo -e ">> MYSQL_USER       = ${RED}${MYSQL_USER}${RESET}"
echo -e ">> MYSQL_PASS       = ${RED}${MYSQL_PASS}${RESET}"
echo -e ">> MYSQL_PORT       = ${RED}${MYSQL_PORT}${RESET}"
echo -e ">> PROJECT_SETTINGS = ${RED}${PROJECT_SETTINGS}${RESET}"

echo -e ">> Variables values end. \n"
