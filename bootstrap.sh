#!/usr/bin/env bash

sudo timedatectl set-timezone America/Toronto

sudo apt-get update
sudo apt-get dist-upgrade

curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -

sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev git build-essential libxml2 libxml2-dev libxslt-dev libsqlite3-dev sqlite3 nodejs

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

~/.rbenv/bin/rbenv init

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

