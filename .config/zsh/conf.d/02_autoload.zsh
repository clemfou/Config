fpath=(
    "${XDG_CONFIG_HOME}/zsh/zfunc"
    "${fpath[@]}"
)

autoload -Uz genpass

autoload -Uz print-256colors

autoload -U colors && colors

autoload -Uz compinit 
autoload -Uz select-bracketed 
autoload -Uz select-quoted
autoload -Uz surround
autoload -Uz edit-command-line
autoload -Uz vcs_info

zle -N add-surround surround
zle -N change-surround surround
zle -N delete-surround surround
zle -N edit-command-line
zle -N select-bracketed
zle -N select-quoted
autoload -Uz zle-prepend-sudo
zle -N zle-prepend-sudo
