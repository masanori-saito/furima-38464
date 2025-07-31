#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
apt-get update
apt-get install -y python3 make g++
ln -s /usr/bin/python3 /usr/bin/python || true

export PYTHON=/usr/bin/python3
npm install