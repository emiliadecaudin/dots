# Environment

export XDG_CONFIG_HOME=${HOME}/.config
export LOCAL_CONFIG=${XDG_CONFIG_HOME}

export LOCAL_BIN=${HOME}/.local/bin
export LOCAL_LIB=${HOME}/.local/lib
export LOCAL_SOFTWARE=${HOME}/.local/opt
export XDG_DATA_HOME=${HOME}/.local/share
export LOCAL_DATA=${XDG_DATA_HOME}
export LOCAL_HISTORY=${LOCAL_DATA}/history

export XDG_CACHE_HOME=${LOCAL_CACHE}
export LOCAL_CACHE=${HOME}/.cache

mkdir -p ${LOCAL_CONFIG}
mkdir -p ${LOCAL_BIN}
mkdir -p ${LOCAL_LIB}
mkdir -p ${LOCAL_SOFTWARE}
mkdir -p ${LOCAL_DATA}
mkdir -p ${LOCAL_HISTORY}
mkdir -p ${LOCAL_CACHE}

# asdf

[[ ! -v ASDF_DIR ]] && export ASDF_DIR=${LOCAL_SOFTWARE}/asdf || true
export ASDF_DATA_DIR=${LOCAL_DATA}/asdf
export ASDF_CONFIG_FILE=${LOCAL_CONFIG}/asdf/asdfrc

# mycli

export MYCLI_HISTFILE=${LOCAL_HISTORY}/mycli_history

# MySQL

export MYSQL_TEST_LOGIN_FILE=${LOCAL_CONFIG}/mysql/mylogin.cnf
export MYSQL_HISTFILE=${LOCAL_HISTORY}/mysql_history

# Oh My ZSH

export ZSH=${LOCAL_SOFTWARE}/oh-my-zsh
export ZSH_CUSTOM=${LOCAL_DATA}/oh-my-zsh

# Python

export PYTHONSTARTUP=${LOCAL_CONFIG}/python/pythonrc.py
export PYTHONHISTORY=${LOCAL_HISTORY}/python_history

# Taskwarrior

export TASKRC=${LOCAL_CONFIG}/taskwarrior/taskrc
export TASKDATA=${LOCAL_DATA}/taskwarrior

# zsh

export ZDOTDIR=${LOCAL_CONFIG}/zsh
export HISTFILE=${LOCAL_HISTORY}/zsh_history
export ZHISTFILE=${HISTFILE}
export ZSH_COMPDUMP=${LOCAL_CACHE}/zcompdump

# Functions

function safe_source {
    [[ -r $1 ]] && source $1 || true
}

function safe_alias {
    command -v $1 &> /dev/null && alias $2 || true
}
