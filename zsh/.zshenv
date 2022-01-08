# Set location of ZSH configuration files.

export ZDOTDIR="${HOME}/.config/zsh"

# Functions

function safe_source {
    [[ -r $1 ]] && source $1 || true
}
