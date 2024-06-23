fpath=(
    "${XDG_CONFIG_HOME}/zsh/zfunc"
    "${fpath[@]}"
)
autoload -Uz zle-keymap-select
zle -N zle-keymap-select
autoload -Uz print-256colors

autoload -U colors && colors

autoload -Uz compinit 
autoload -Uz select-bracketed 
autoload -Uz select-quoted
autoload -Uz surround
autoload -Uz vcs_info

zle -N select-bracketed
zle -N select-quoted
zle -N add-surround surround
zle -N change-surround surround
zle -N delete-surround surround
