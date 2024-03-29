# Host Specific Profiles

safe_source ${LOCAL_CONFIG}/zsh/host.zprofile

# Homebrew

export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_BAT=1

# Local Paths

path=(${LOCAL_BIN} $path)
path=(${HOME}/.local/dots/bin $path)
manpath+=(${LOCAL_MAN})
export INFOPATH="${INFOPATH:-}:${LOCAL_INFO}"
