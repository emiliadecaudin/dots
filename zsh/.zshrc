# Powerlevel10k Instant Prompt

safe_source ${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh

# alises

alias ffprobe='ffprobe -hide_banner'

# Host Specific RCs

safe_source ${CONFIG}/zsh/hosts/$(hostname -s).zshrc

# iTerm2 Integration

safe_source ${CONFIG}/iterm2/.iterm2_shell_integration.zsh

# oh-my-zsh

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins+=(colored-man-pages zsh-syntax-highlighting)
ZSH_DISABLE_COMPFIX=true
safe_source $ZSH/oh-my-zsh.sh

# Powerlevel10k

safe_source ${HOME}/.p10k.zsh
