# Powerlevel10k Instant Prompt

safe_source ${LOCAL_CACHE}/p10k-instant-prompt-${(%):-%n}.zsh

# Host Specific RCs

safe_source ${LOCAL_CONFIG}/zsh/host.zshrc

# iTerm2 Integration

zstyle :omz:plugins:iterm2 shell-integration yes

# Oh My Zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins+=(colored-man-pages iterm2 zsh-syntax-highlighting)
ZSH_DISABLE_COMPFIX=true
safe_source ${ZSH}/oh-my-zsh.sh

# Powerlevel10k

safe_source ${LOCAL_CONFIG}/powerlevel10k/p10k.zsh

# zsh (Again)

export HISTFILE=${ZHISTFILE}
unset ZHISTFILE

# Update Paths

path=(${HOME}/.local/dots/bin $path)
path=(${LOCAL_BIN} $path)
path=(${ASDF_DATA_DIR}/shims $path)
fpath=(${LOCAL_DATA}/functions $fpath)

# GIT_EDITOR

export GIT_EDITOR=nano

if [[ $(command -v fresh) ]]; then
    export GIT_EDITOR="fresh"
fi

if [[ -v VSCODE_INJECTION ]]; then
    export GIT_EDITOR="code --wait"
fi

# Reload Completions

autoload -Uz compinit
compinit -d ${ZSH_COMPDUMP}

# Aliases

safe_alias bat cat="bat --paging=never"
safe_alias ffprobe ffprobe="ffprobe -hide_banner"
safe_alias mycli mycli="mycli --defaults-file=${LOCAL_CONFIG}/mysql/my.cnf --myclirc ${LOCAL_CONFIG}/mycli/myclirc"
safe_alias mysql mysql="mysql --defaults-file=${LOCAL_CONFIG}/mysql/my.cnf"
safe_alias pip pip_wipe="pip freeze | xargs pip uninstall -y"
safe_alias vim vim="vim -i ${LOCAL_HISTORY}/viminfo"
