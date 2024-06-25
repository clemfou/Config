compinit -d "${HOME}/.zcompdump"

zmodload zsh/complist

zstyle ':completion:*' verbose true
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-dirs-first true

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${HOME}/.zsh/cache"

zstyle ':completion:*:descriptions' format '%U%F{129}Matching: %d%u%f'
zstyle ':completion:*:corrections' format '%F{166}Error: %d %f%u'
zstyle ':completion:*:warnings' format '%F{160}No match for any of: %f%d'

zstyle ':completion::complete:-tilde-:*:' tag-order directory-stack named-directories users
