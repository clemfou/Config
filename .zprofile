path+=(
    "${HOME}/.local/bin"
)
export PATH

export FZF_COMPLETION_OPTS='--border --info=inline'
export KEYTIMEOUT=1 # remove annoying delay entering vi mode
export LC_ALL="en_US.UTF-8"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export TERM=xterm-256color
export XDG_CONFIG_HOME="$HOME/.config"
