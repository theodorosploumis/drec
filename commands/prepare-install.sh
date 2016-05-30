#!/usr/bin/env bash
# Prepare a Drupal site for installation

# Enter project path
echo -e ">> Preparing Drupal project at ${PROJECT_PATH}"

# Create setting.php file
echo -e ">> Create setting.php file"
sudo cp "${PROJECT_PATH}"/sites/default/default.settings.php "${PROJECT_PATH}"/sites/default/settings.php
sudo chmod 777 "${PROJECT_PATH}"/sites/default/settings.php

# Create public files folder
echo -e ">> Create public files folder"
sudo mkdir "${PROJECT_PATH}"/sites/default/files

# Change owner and mode of public files
echo -e ">> Change owner and mode of public files"
sudo chown -R www-data:www-data "${PROJECT_PATH}"/sites/default
sudo chmod -R 777 "${PROJECT_PATH}"/sites/default/files
sudo chmod 644 "${PROJECT_PATH}"/sites/default/default.settings.php
sudo chmod 644 "${PROJECT_PATH}"/sites/default/default.services.yml

echo -e ">> Drupal project is ready for installation."
