zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' get-revision true
zstyle ':vcs_info:git:*' stagedstr '%F{2} %F{7}'
zstyle ':vcs_info:git:*' unstagedstr '%F{94} %F{7}'
zstyle ':vcs_info:git:*' formats '%F{5}%F{7}-%b %u%c%m'
zstyle ':vcs_info:git:*' actionformats '%b %F{3} %m'
zstyle ':vcs_info:git:*' patch-format '%7>>%p%<< %F{7}(%n applied)'

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-untracked git-stash

function +vi-git-st() {
  local ahead behind remote
  local -a gitstatus

  remote=${$(git rev-parse --verify ${hook_com[branch]}@{u} --symbolic-full-name 2> /dev/null)/refs\/remotes\/}

  if [[ -n "${remote}" ]] then;
    IFS=$'\t' read -r ahead behind <<<"$(git rev-list --left-right --count HEAD...@{u})"

    (( ahead )) && gitstatus+=( " ${ahead}" )
    (( behind )) && gitstatus+=( "$ {behind}" )
  fi

  hook_com[misc]+="${(j:/:)gitstatus}"
}

function +vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
      [[ -n $(git ls-files --others --exclude-standard) ]] ; then

      hook_com[staged]+='%F{1} %F{7}'
  fi
}

function +vi-git-stash() {
  local stash

  stash=$(git rev-list --walk-reflogs --count refs/stash 2> /dev/null)
  [[ "${stash}" -eq 0  ]] && return

  hook_com[misc]+=" " 
}
