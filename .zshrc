eval "$(dircolors)"
eval "$(pyenv init -)"

source "${HOME}/.config/zsh/conf.d/01_options.zsh"
source "${HOME}/.config/zsh/conf.d/02_autoload.zsh"
source "${HOME}/.config/zsh/conf.d/03_aliases.zsh"
source "${HOME}/.config/zsh/conf.d/03_completion.zsh"
source "${HOME}/.config/zsh/conf.d/04_keybinds.zsh"
source "${HOME}/.config/zsh/conf.d/prompt.zsh"

source <(fzf --zsh)
