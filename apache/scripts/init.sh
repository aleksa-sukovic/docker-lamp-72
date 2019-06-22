#!/bin/bash

# Preparing
export TERM=xterm

if [[ -d /var/www/html ]]; then
    rmdir /var/www/html
fi

# Dotfile
echo "[[ -f /root/.profile ]] && . /root/.profile" >> /root/.bashrc

# Bringing apache to foreground
cmd="apache2-foreground"
eval "$cmd"
