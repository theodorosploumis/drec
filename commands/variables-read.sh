#!/usr/bin/env bash
# Read variables from a settings file

if [ ! -e "${PROJECT_SETTINGS}" ]
then
  echo -e ">> File ${PROJECT_SETTINGS} does not exist."
else
  read -d $'\x04' name < "${PROJECT_SETTINGS}"
fi
