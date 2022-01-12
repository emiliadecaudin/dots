# Set location of ZSH configuration files.

export ZDOTDIR=${HOME}/.config/zsh

# Functions

function safe_source {
    [[ -r $1 ]] && source $1 || true
}

function safe_alias {
    command -v $1 &> /dev/null && alias $2 || true
}