#!/usr/bin/env bash
# Run "composer create-project" to initialize a Drupal project

# Enter project path
echo -e ">> Running 'composer install' for Drupal project at ${PROJECT_PATH}."

cd "{PROJECT_PATH}" && \
Y | composer create-project drupal/drupal "${PROJECT_PATH}" "${DRUPAL_VERSION}"
