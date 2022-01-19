# Host Specific Profiles

safe_source ${LOCAL_CONFIG}/zsh/host.zprofile

# Homebrew

[[ -x "/usr/local/bin/brew" ]] && eval $(/usr/local/bin/brew shellenv) || true
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Local Bin

path=(${LOCAL_BIN} $path)
