#!/bin/bash

# Preparing
export TERM=xterm

if [[ -d /var/www/html ]]; then
    rmdir /var/www/html
fi

chmod -R 777 /var/www

# Bringing apache to foreground
cmd="apache2-foreground"
eval "$cmd"
