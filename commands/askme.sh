#!/usr/bin/env bash
# Continue or exit

echo -n ">> Do you want to continue? [Y/n]: "
read ASKME

if [[ ${ASKME} =~ ^([yY][eE][sS]|[yY])$ ]]
then
  echo -e ">> Fine, let's move on..."
else
  echo -e ">> Aborting, goodbye."
  ABORT=1
fi

export ABORT
