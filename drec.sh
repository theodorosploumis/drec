#!/usr/bin/env bash
# Drupal 8.x scripts. See more at http://TODO.com
# TODO commands: site-rebuild, drush-alias, list-projects

# Required default scripts

# Invoke the script from anywhere (e.g .bashrc alias)
#DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIR="$(dirname $0)"
DIR_COMMANDS="${DIR}"/commands

# Colors with tput
RED="$(tput setaf 7 && tput setab 1)"
RESET="$(tput sgr0)"

# Default functions
# (!) New commands should be added on the error message too (!)
function drec(){

  # Create a home folder to store the projects config files
  if [[ ! -d "$HOME"/.drec ]]
    then
      mkdir "$HOME"/.drec
      chown $USER:$USER "$HOME"/.drec
  fi

  # Source extra commands
  #EXTRA_COMMANDS="${DIR}"/drec.commands
  #source "${EXTRA_COMMANDS}"

  # If no argument passed show help message
  if [[ -z "$1" ]];
    then
      echo -e "Usage: $0 arg1,arg2,arg3... /path/to/.drecfile"
      echo -e "Use comma (,) seperated arguments"
      echo -e "The order of the arguments is the order of execution!"
      echo -e "Available arguments:${RED}\n\
git-clone        Clone a site from a git repo \n\
create-folder    Create the project folder \n\
delete-folder    Delete the project folder \n\
create-vhost     Create a virtualhost for project's domain \n\
delete-vhost     Create a virtualhost \n\
install-drupal   Install Drupal using drush \n\
prepare-install  Prepare a Drupal site for installation (public files, writable settings etc) \n\
create-docker    Create a docker container \n\
delete-docker    Delete a docker container \n\
composer-install Run 'composer install' on project path \n\
composer-project Run 'composer create-project ...' on project path \n\
create-drush     Create a druah alias \n\
delete-drush     Delete a drush alias \n\
create-db        Create a mysql database \n\
download-db      Download a mysql database \n\
delete-db        Delete a mysql database \n\
askme            Asks user to continue or exit \n\
init             Create a *.drecfile settings file on the project folder \n\
projects         Show all *.drecfile filenames inside ~/.drec folder \n\
delete-project   Delete all project files, database, container, drush alias etc \n\
debug            Show variables on cli \n\
${RESET}"
    echo -e "Example: $0 init,git-clone,create-docker myProjectSettings \n"
    echo -e "Example: $0 init,git-clone,prepare-install,create-db,create-vhost,install-drupal \n"
    echo -e "Settings .drecfile example: ${DIR}/settings/default.drecfile \n"
    return
  fi

  # If we have a file passed as argument source it
  if [[ $1 && $2 && ${2: -12} == ".drecfile" ]]
  then
    echo -e ">> Using custom settings file ($2)"
    PROJECT_SETTINGS="$2"
    export PROJECT_SETTINGS
    source "$2"
  fi

  # If we have a file passed from the .drec folder without the extension
  if [[ $2 && ${2: -12} != ".drecfile" && -e $HOME/.drec/${2}.drecfile ]]
    then
      echo -e ">> Using settings file ($HOME/.drec/${2}.drecfile)"
      PROJECT_SETTINGS="$HOME/.drec/${2}.drecfile"
      export PROJECT_SETTINGS
      source "$HOME/.drec/${2}.drecfile"
  fi

  # No settings file
  if [[ $1 && -z $2 && $1 != "debug" && $1 != "projects" && $1 != "delete-project" ]]
    then
      echo -e ">> No settings file provided, let's create some variables."
      source "${DIR}"/settings/default.drecfile
      source "${DIR_COMMANDS}"/setup.sh
  fi

  # Show what we have until now
  # By default do not abort the execution
  ABORT=0
  if [[ $1 != "projects" && $1 != "delete-project" ]]
    then
      source "${DIR_COMMANDS}"/variables-debug.sh
      # Ask user if s/he wants to continue before it is too late.
      # This may set the ABORT variable equal to 1.
      source "${DIR_COMMANDS}"/askme.sh
  fi

  # Get list of args separated with comma (,)
  if [[ $ABORT != 1 ]];
    then
      ARGS=$(echo "$1" | sed "s/ /,/g")
    else
      ARGS=""
  fi

  for arg in $(echo $ARGS | tr "," " ");
  do
    case $arg in
      git-clone)
      source "${DIR_COMMANDS}"/git-clone.sh
      ;;
      create-folder)
      source "${DIR_COMMANDS}"/create-folder.sh
      ;;
      delete-folder)
      source "${DIR_COMMANDS}"/delete-folder.sh
      ;;
      create-vhost)
      source "${DIR_COMMANDS}"/create-vhost.sh
      ;;
      delete-vhost)
      source "${DIR_COMMANDS}"/delete-vhost.sh
      ;;
      install-drupal)
      source "${DIR_COMMANDS}"/install-drupal.sh
      ;;
      prepare-install)
      source "${DIR_COMMANDS}"/prepare-install.sh
      ;;
      create-docker)
      source "${DIR_COMMANDS}"/create-docker.sh
      ;;
      delete-docker)
      source "${DIR_COMMANDS}"/delete-docker.sh
      ;;
      create-drush)
      source "${DIR_COMMANDS}"/create-drush.sh
      ;;
      delete-drush)
      source "${DIR_COMMANDS}"/delete-drush.sh
      ;;
      composer-install)
      source "${DIR_COMMANDS}"/composer-install.sh
      ;;
      composer-project)
      source "${DIR_COMMANDS}"/composer-project.sh
      ;;
      create-db)
      source "${DIR_COMMANDS}"/create-db.sh
      ;;
      download-db)
      source "${DIR_COMMANDS}"/download-db.sh
      ;;
      delete-db)
      source "${DIR_COMMANDS}"/delete-db.sh
      ;;
      askme)
      source "${DIR_COMMANDS}"/askme.sh
      ;;
      init)
      source "${DIR_COMMANDS}"/variables-write.sh
      ;;
      debug)
      if [[ $1 != "debug" ]];
        then
          source "${DIR_COMMANDS}"/variables-debug.sh
        else
          echo -e ">> ${RED}No settings file provided. Select on project of existing or create a new one${RESET}"
          echo -e ">> Create a new settings file, use: ${RED}drec init${RESET}"
          echo -e ">> Use an existing settings file, use: ${RED}drec projects${RESET}"
      fi
      ;;
      projects)
      source "${DIR_COMMANDS}"/projects.sh
      ;;
      delete-project)
      if [[ ! $2 ]];
        then
          echo -e ">> ${RED}No project file provided. Run 'drec projects' to see available projects. Abording.${RESET}"
        else
          source "${DIR_COMMANDS}"/delete-project.sh
      fi
      ;;
      *)
      echo -e ">> ${RED}Argument $arg not found.${RESET}"
      $0
      return
      ;;
    esac
  done

}
