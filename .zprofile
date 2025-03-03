export FZF_COMPLETION_OPTS='--border --info=inline'
export KEYTIMEOUT=1 # remove annoying delay entering vi mode
export LC_ALL="en_US.UTF-8"
export PYENV_ROOT="${HOME}/.pyenv"
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export TERM=xterm-256color
export XDG_CONFIG_HOME="${HOME}/.config"

PATH+=(
    "${HOME}/.local/bin"
    "${PYENV_ROOT}/bin"
)
export PATH
