#!/bin/sh

# Following command will:
#   - Add NodeSource siging key, creates an apt source repository,
#   - installs all necessary packages and refresh the apt cache
curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Install Node and NPM (bundled together)
apt install nodejs -y
