export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano

# Colors
BROWN="\033[0;33m"
MAGENTA="\033[1;31m"
ORANGE="\033[1;33m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
BOLD=""
RESET="\033[m"
BLUE="\e[1;34m"

export PS1="\[$ORANGE\]\u@\h > \w\n\[$RESET\]\$ "

# Navigation
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# This allows you to open aliases with sudo too
alias sudo="sudo "

# Files
alias hosts='sudo $EDITOR /etc/hosts'
alias please='sudo "$BASH" -c "$(history -p !!)"'

# ls command
alias l="ls -l"
alias la="ls -la"
alias lsd='ls -l | grep "^d"'

# Utilities
alias allow="sudo chmod -R 755"
alias fs="du -sh"

# Laravel framework
alias art='php artisan'

# Functions
phput()
{
	COMMAND="./vendor/bin/phpunit --filter $1"

	eval $COMMAND
}
