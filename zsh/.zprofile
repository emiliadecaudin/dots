# Custom Environment

export CONFIG=${HOME}/.config
export LOCAL=${HOME}/.local
export HISTFILE=${CONFIG}/zsh/.zsh_history

# Host Specific Profiles

safe_source ${CONFIG}/zsh/host.zprofile

# asdf

export ASDF_DIR=${LOCAL}/asdf
export ASDF_DATA_DIR=${LOCAL}/asdf
export ASDF_CONFIG_FILE=${CONFIG}/asdf/asdfrc

# Homebrew

[[ -x "/usr/local/bin/brew" ]] && eval $(/usr/local/bin/brew shellenv) || true

# Taskwarrior

export TASKRC=${CONFIG}/taskwarrior/taskrc
export TASKDATA=${HOME}/.local/taskwarrior
