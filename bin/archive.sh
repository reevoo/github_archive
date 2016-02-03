#!/bin/bash

set -e

export REPO=$@
export GITHUB_ORG=reevoo
export GIT_SERVER=git@code

if [ "$REPO" = "" ]; then
  echo "USAGE"
  echo "bin/archive.sh <REPONAME>"
  echo "configure github org and local git server by editing this script :)"
  exit 0
fi

bin/clonerepo.sh
bin/mkrepo.sh
bin/syncrepo.sh

echo "********** kthnksbye *************"
echo "everything *seems* fine"
echo "git@github.com:$GITHUB_ORG/$REPO was cloned to $GIT_SERVER:$REPO"
echo "********** kthnksbye *************"
