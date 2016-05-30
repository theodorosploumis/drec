#!/usr/bin/env bash
# Run "composer install" on the Drupal project

# Enter project path
echo -e ">> Running 'composer install' for Drupal project at ${PROJECT_PATH}"
cd "{PROJECT_PATH}" && composer install
