<img src="drec-logo.png" align="right" alt="drec logo">

## drec

DRupal Eight Commands (DR.E.C.)

Drupal 8.x development scripts.

### About
A collection of basic bash scripts that work together to accomplish common
development tasks for **Drupal 8.x** projects.

You could probably use `drec` locally or on a development environment
and not on a production server.

Your local (or other development) UNIX environment should be consisted of:
 - apache
 - mysql-server
 - php
 - [drupalconsole](http://drupalconsole.com)
 - drush
 - composer
 - git
 - [virtualhost script](https://github.com/RoverWire/virtualhost)
 - docker

Works (hopefully) on UNIX systems.

### Install
 - Download project (prefer with git)
 - Create an alias to file `drec.sh`
 - Test it on the cli `drec`

### Running commands

 - You should run usually more that 2 commands together.
 - Some commands need some other in order to work properly.
 - The order of the commands is the order of execution.
 - You can run `drec` from any location.
 - The configuration file has a suffix of `.drecfile` and it is a plain text.

#### See available help

```
// Simply run:
drec
```

#### Basic commands (more to be added)

| Command | Description |
|---------|-------------|
| git-clone | Clone a site from a git repo |
| create-folder | Create the project folder |
| delete-folder | Delete the project folder |
| create-vhost | Create a virtualhost for project's domain |
| delete-vhost | Create a virtualhost |
| install-drupal | Install Drupal using drush |
| prepare-install | Prepare a Drupal site for installation (public files, writable settings etc) |
| create-docker | Create a docker container |
| delete-docker | Delete a docker container |
| create-drush | Create a drush alias |
| delete-drush | Delete a drush alias |
| composer-install | Run `composer install` on the project folder |
| composer-project | Run `composer create-project ...` on the project folder |
| create-db | Create a mysql database |
| download-db | Download a mysql database |
| delete-db | Delete a mysql database |
| askme | Asks user to continue or exit |
| init | Create a *.drecfile settings file on the ~/.drec folder |
| delete-project | Delete all project files, database, container, drush alias etc |
| projects | Show all *.drecfile filenames inside ~/.drec folder |
| debug | Show variables on cli |


#### Usage examples

```
// Clone a project and start a docker container with mapping folders
drec init,git-clone,create-docker

// Clone a project from a git repo, create a virtualhost and create a new configuration file
drec init,git-clone,create-vhost

// Create a new database, clone from git repo, prepare for Drupal installation and install Drupal
drec init,create-db,git-clone,prepare-install,install-drupal

// Just debug a configuration file and read its values
drec debug /path/to/MYFILE.drecfile
drec debug filename/of/.drecfile
```

### Extend the commands (TBD, not working at the moment!)
  - Copy the default file default.command.txt inside the folder `commands`.
  - Add your commands on it (read the docs inside).
  - Change it to be a `.sh` file.
  - Make it executable (`chmod +x /path/to/command`)
  - Source it to the file `drec.commands` (read the docs inside)
  - Test it `drec <new_command>`
  - Add the new command to the command help on `drec.sh` file
  - Update the README.md
  - Is the command so cool, create a pull request to add this on the default commands

### Configuration file
`drec` creates or reads any file with suffix `.drecfile`.
Example `myProject.drecfile`.

Here is an example of such a file. See the default file at [settings/default.drecfile](settings/default.drecfile)

```
PROJECT_TITLE="drec - This is my title"
REPO="git@github.com:drupal/drupal.git"
ROOT="/var/www/html"
PROFILE="minimal"
BRANCH="8.0.5"
DOMAIN="drec-example.local"
PROJECT_PATH="/var/www/html/drec-example.local"
HOST_PORT_HTTP="8098"
HOST_PORT_SSH="8012"
DOCKER_IMAGE="drupal:8.0.5-apache"
CONTAINER_NAME="minimal_8098_8012"
DATABASE="mydatabasename"
VHOST="drec-example.local"
MYSQL_USER="root"
MYSQL_PASS="root"
MYSQL_PORT="3306"
PROJECT_SETTINGS="~/.drec/drecexamplelocal.drecfile"
```
### Roadmap and future plans

  - Add validation and checks per variable (eg on input)
  - Add validation or reformat of the .drecfile (structure)
  - Make separated setups (files) for each variable
  - Make commands more independent
  - Create an installation script for the whole repo (shortcut)
  - Add better description/docs for the commands
  - Create a docker-compose.yml file from the settings

### Similar tools

See a more complete list at [Drupal (local) development tools](http://goo.gl/ucwWdt).

 - [Dropcat - Deploy tool for Drupal](https://gitlab.wklive.net/wk-public/dropcat)
 - [drush fetcher](https://www.drupal.org/project/fetcher)
 - [druleton/druleton](https://github.com/druleton/druleton)
 - [popstas/drupal-scripts](https://github.com/popstas/drupal-scripts)
 - [cul-it/drupal-scripts](https://github.com/cul-it/drupal-scripts)
 - [jazio/drustalls](https://github.com/jazio/drustalls)
 - [electrickite/damp](https://github.com/electrickite/damp)
 - [geraldvillorente/drupaltools](https://github.com/geraldvillorente/drupaltools)
 - [psynaptic/bash_kit](https://github.com/psynaptic/bash_kit)
 - [reactivestudio/SH](https://github.com/reactivestudio/SH)
 - [rafaqz/drupal_build_scripts](https://github.com/rafaqz/drupal_build_scripts)
 - [alexharries/drupal-scripts-of-usefulness](https://github.com/alexharries/drupal-scripts-of-usefulness)
 - [felloe/drupal8installer](https://github.com/felloe/drupal8installer)
 - [meosch/localdevsetup](https://github.com/meosch/localdevsetup)
 - [acquia/blt](https://github.com/acquia/blt)


### License

[MIT](LICENSE)

Drupal is a [registered trademark](http://drupal.com/trademark) of [Dries Buytaert](http://buytaert.net/).
