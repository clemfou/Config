setopt auto_cd
setopt auto_pushd
setopt auto_remove_slash
setopt brace_ccl
setopt chase_links
setopt clobber
setopt correct
setopt extended_glob
setopt glob_dots
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt nobeep
setopt nonomatch
setopt notify
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_silent
setopt share_history
unsetopt hist_beep
unsetopt list_beep
unsetopt rm_star_silent

HISTFILE="${HOME}/.zsh_history"
HISTORY_IGNORE="*git*|*vim*"
HISTSIZE=1000000
SAVEHIST=1000000
