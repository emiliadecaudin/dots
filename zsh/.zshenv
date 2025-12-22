# Environment

export LOCAL_BIN=${HOME}/.local/bin
export LOCAL_CACHE=${HOME}/.local/var/cache
export LOCAL_CONFIG=${HOME}/.local/etc
export LOCAL_DATA=${HOME}/.local/share
export LOCAL_HISTORY=${HOME}/.local/var/history
export LOCAL_INFO=${HOME}/.local/share/info
export LOCAL_LIB=${HOME}/.local/lib
export LOCAL_LOGS=${HOME}/.local/var/logs
export LOCAL_MAN=${HOME}/.local/share/man
export LOCAL_SOFTWARE=${HOME}/.local/opt

mkdir -p ${LOCAL_BIN}
mkdir -p ${LOCAL_CACHE}
mkdir -p ${LOCAL_CONFIG}
mkdir -p ${LOCAL_DATA}
mkdir -p ${LOCAL_HISTORY}
mkdir -p ${LOCAL_INFO}
mkdir -p ${LOCAL_LIB}
mkdir -p ${LOCAL_LOGS}
mkdir -p ${LOCAL_MAN}
mkdir -p ${LOCAL_SOFTWARE}

export XDG_BIN_HOME=${LOCAL_BIN}
export XDG_CACHE_HOME=${LOCAL_CACHE}
export XDG_CONFIG_HOME=${LOCAL_CONFIG}
export XDG_DATA_HOME=${LOCAL_DATA}
export XDG_STATE_HOME=${HOME}/.local/var

# asdf

export ASDF_CONFIG_FILE=${LOCAL_CONFIG}/asdf/asdfrc
export ASDF_DATA_DIR=${LOCAL_DATA}/asdf

# awscli

export AWS_CONFIG_FILE=${LOCAL_CONFIG}/aws/config
export AWS_SHARED_CREDENTIALS_FILE=${LOCAL_CONFIG}/aws/credentials

# Homebrew

export HOMEBREW_BAT=1
export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_NO_ENV_HINTS=1

# less

export LESSHISTFILE=${LOCAL_HISTORY}/less.history

# mycli

export MYCLI_HISTFILE=${LOCAL_HISTORY}/mycli.history

# MySQL

export MYSQL_HISTFILE=${LOCAL_HISTORY}/mysql.history
export MYSQL_TEST_LOGIN_FILE=${LOCAL_CONFIG}/mysql/mylogin.cnf

# Oh My ZSH

export ZSH_CACHE_DIR=${LOCAL_CACHE}/oh-my-zsh
export ZSH_CUSTOM=${LOCAL_DATA}/oh-my-zsh
export ZSH=${LOCAL_SOFTWARE}/oh-my-zsh

# Poetry

export POETRY_HOME=${LOCAL_SOFTWARE}/pypoetry

# Python

export PYTHONHISTORY=${LOCAL_HISTORY}/python.history
export PYTHONSTARTUP=${LOCAL_CONFIG}/python/pythonrc.py

# Rust

export CARGO_INSTALL_ROOT=${HOME}/.local

# zsh

export HISTFILE=${LOCAL_HISTORY}/zsh.history
export ZDOTDIR=${LOCAL_CONFIG}/zsh
export ZHISTFILE=${HISTFILE}
export ZSH_COMPDUMP=${LOCAL_CACHE}/zcompdump

# Update Manual Paths

export INFOPATH="${INFOPATH:-}:${LOCAL_INFO}"
manpath+=(${LOCAL_MAN})

# Update Executable and Function Paths (If Not Interactive)

if [[ ! -o interactive ]]; then
    path=(${HOME}/.local/dots/bin $path)
    path=(${LOCAL_BIN} $path)
    path=(${ASDF_DATA_DIR}/shims $path)
    fpath=(${LOCAL_DATA}/functions $fpath)
fi

# Functions

function safe_source {
    [[ -r $1 ]] && source $1 || true
}

function safe_alias {
    command -v $1 &> /dev/null && alias $2 || true
}
