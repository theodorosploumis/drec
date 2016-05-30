#!/usr/bin/env bash
# Clone full Drupal site

# Clone repository, usually from Github or Bitbucket
echo -e ">> Cloning repository '${REPO}' to '${PROJECT_PATH}' with branch '${BRANCH}'"
git clone ${REPO} ${PROJECT_PATH} --branch ${BRANCH}
