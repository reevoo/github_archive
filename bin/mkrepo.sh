#!/bin/bash

ssh $GIT_SERVER REPO=$REPO 'bash -s' << 'ENDSSH'
  if [ -d "$REPO.git" ]; then
    echo "$REPO allready exists on git@code, perhaps someone allreay ran this?"
    exit 1
  fi
ENDSSH

ssh $GIT_SERVER REPO=$REPO 'bash -s' << 'ENDSSH'
  mkdir $REPO.git && \
  cd $REPO.git && \
  git init --bare .
ENDSSH

ssh $GIT_SERVER REPO=$REPO 'bash -s' << 'ENDSSH'
  if [ ! -d "$REPO.git" ]; then
    echo "something went horibly wrong, I give up"
    exit 1
  fi
ENDSSH
