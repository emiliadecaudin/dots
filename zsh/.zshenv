# Environment

export LOCAL_CONFIG=${HOME}/.local/etc
export LOCAL_BIN=${HOME}/.local/bin
export LOCAL_LIB=${HOME}/.local/lib
export LOCAL_SOFTWARE=${HOME}/.local/opt
export LOCAL_DATA=${HOME}/.local/share
export LOCAL_MAN=${HOME}/.local/share/man
export LOCAL_INFO=${HOME}/.local/share/info
export LOCAL_HISTORY=${HOME}/.local/var/history
export LOCAL_LOGS=${HOME}/.local/var/logs
export LOCAL_CACHE=${HOME}/.local/var/cache

mkdir -p ${LOCAL_CONFIG}
mkdir -p ${LOCAL_BIN}
mkdir -p ${LOCAL_LIB}
mkdir -p ${LOCAL_SOFTWARE}
mkdir -p ${LOCAL_DATA}
mkdir -p ${LOCAL_MAN}
mkdir -p ${LOCAL_INFO}
mkdir -p ${LOCAL_HISTORY}
mkdir -p ${LOCAL_LOGS}
mkdir -p ${LOCAL_CACHE}

export XDG_CONFIG_HOME=${LOCAL_CONFIG}
export XDG_DATA_HOME=${LOCAL_DATA}
export XDG_STATE_HOME=${HOME}/.local/var
export XDG_CACHE_HOME=${LOCAL_CACHE}

# asdf

export ASDF_DATA_DIR=${LOCAL_DATA}/asdf
export ASDF_CONFIG_FILE=${LOCAL_CONFIG}/asdf/asdfrc

# awscli

export AWS_CONFIG_FILE=${LOCAL_CONFIG}/aws/config
export AWS_SHARED_CREDENTIALS_FILE=${LOCAL_CONFIG}/aws/credentials

# less

export LESSHISTFILE=${LOCAL_HISTORY}/less.history

# mycli

export MYCLI_HISTFILE=${LOCAL_HISTORY}/mycli.history

# MySQL

export MYSQL_TEST_LOGIN_FILE=${LOCAL_CONFIG}/mysql/mylogin.cnf
export MYSQL_HISTFILE=${LOCAL_HISTORY}/mysql.history

# Oh My ZSH

export ZSH=${LOCAL_SOFTWARE}/oh-my-zsh
export ZSH_CUSTOM=${LOCAL_DATA}/oh-my-zsh
export ZSH_CACHE_DIR=${LOCAL_CACHE}/oh-my-zsh

# Poetry

export POETRY_HOME=${LOCAL_SOFTWARE}/pypoetry

# Python

export PYTHONSTARTUP=${LOCAL_CONFIG}/python/pythonrc.py
export PYTHONHISTORY=${LOCAL_HISTORY}/python.history

# Rust

export CARGO_INSTALL_ROOT=${HOME}/.local

# zsh

export ZDOTDIR=${LOCAL_CONFIG}/zsh
export HISTFILE=${LOCAL_HISTORY}/zsh.history
export ZHISTFILE=${HISTFILE}
export ZSH_COMPDUMP=${LOCAL_CACHE}/zcompdump

# Functions

function safe_source {
    [[ -r $1 ]] && source $1 || true
}

function safe_alias {
    command -v $1 &> /dev/null && alias $2 || true
}
