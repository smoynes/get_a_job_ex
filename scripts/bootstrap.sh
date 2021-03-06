#!/bin/bash
set -e
TIMEZONE="$1"

hostname wakesiah-dev

echo "$TIMEZONE" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "Installing erlang vendor repo"
apt-add-repository -y \
  "deb http://packages.erlang-solutions.com/ubuntu trusty contrib" > /dev/null
curl -s https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | \
  apt-key add - > /dev/null

echo "Installing nodejs vendor repo"
apt-add-repository -y ppa:chris-lea/node.js

echo "Updating apt cache"
apt-get update -q -y

echo "Upgrading packages"
apt-get upgrade -q -y

echo "Installing build tools"
apt-get install -q -y build-essential curl git-core pkg-config zip

echo "Installing erlang"
apt-get install -q -y esl-erlang erlang-manpages elixir

echo "Installing postgres"
apt-get install -q -y postgresql-9.3 postgresql-client-9.3

sudo -u postgres psql -c \
  "CREATE ROLE get_a_job WITH CREATEROLE CREATEDB LOGIN \
   PASSWORD 'password';" || true

### TODO: set PGUSER and PGHOSTNAME env vars

echo "Installing nodejs"
apt-get install -q -y nodejs

echo "Provisioning completed: ok"
