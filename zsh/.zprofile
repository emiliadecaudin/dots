# Custom Environment

export CONFIG="${HOME}/.config"

# Host Specific Profiles

source ${CONFIG}/zsh/hosts/$(hostname -s).zprofile
