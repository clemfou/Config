venv_info() {
    [ ${VIRTUAL_ENV} ] && echo '('$(basename ${VIRTUAL_ENV})') '
}

zle-line-init() {
    zle -K viins
    echo -ne "\e[2 q"
}

zle -N zle-line-init

preexec() {
    echo -ne '\e[2 q'
}

precmd() { 
  vcs_info 

  PROMPT='$(venv_info)%(!.%F{160}.%F{32})%n%f@%m %3~ ${vcs_info_msg_0_}%f%F{5}» %f'
}
