#!/usr/bin/env bash
set -e

GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'

print() {
  echo -e "${2:-$BLUE}== $1 ==\033[0m"
}

function finish {
  if [ $? -ne 0 ];
  then
    print 'DEPLOY FAILED' $RED
  else
    print 'DEPLOY SUCCESS' $GREEN
  fi
}
trap finish EXIT

print 'logging in'
heroku container:login

print 'pushing container'
heroku container:push web -a dots-andboxes

print 'releasing container'
heroku container:release web -a dots-andboxes
