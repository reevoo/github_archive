#!/bin/bash

cd tmp/$REPO
git remote add code $GIT_SERVER:$REPO.git
git fetch && git branch -r | grep origin | sed 's/.*origin\///' | while read b; do git push code origin/$b:refs/heads/$b; done
