# Custom Environment

export CONFIG="${HOME}/.config"

# Host Specific Profiles

safe_source ${CONFIG}/zsh/hosts/$(hostname -s).zprofile
