#!/usr/bin/env bash
# Create the vhost using command from https://github.com/RoverWire/virtualhost

if ! command -v virtualhost >/dev/null 2>&1 ;
then
  echo -e ">> Command virtualhost does not exist. Install from https://github.com/RoverWire/virtualhost"
  return
fi

# Enter if you want to create a vhost
echo -n ">> Create a vhost on current folder [Y/n]: "
read CREATE_VHOST

# Create vhost or abort
if [[ ${CREATE_VHOST} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo -e ">> Creating vhost '${VHOST}' on path '${PROJECT_PATH}'."
  sudo virtualhost create ${VHOST} ${PROJECT_PATH}
else
  echo -e "Aborting, continue."
fi
