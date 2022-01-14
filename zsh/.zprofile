# Host Specific Profiles

safe_source ${LOCAL_CONFIG}/zsh/host.zprofile

# Homebrew

[[ -x "/usr/local/bin/brew" ]] && eval $(/usr/local/bin/brew shellenv) || true

# Local Bin

path=(${LOCAL_BIN} $path)