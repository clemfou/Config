alias config="PRE_COMMIT_ALLOW_NO_CONFIG=1 git --git-dir=${HOME}/.cfg/ --work-tree=${HOME}"
local _gitLogFormat="%Cblue%h%Creset - %Cred[%ad]%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset"
alias _gitLogOneline='git log --oneline --color=always --format=${_gitLogFormat} --date=format-local:%Y-%m-%d "$@"'

alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -lah'
alias vim='nvim'
alias vimdiff='nvim -d'

alias tree='tree -C'

function git() {
    case "${1}" in
        lg)
            git_commit_finder
            ;;
        *)
            command git "${@}"
            ;;
    esac
}

function git_commit_checkout() {
    local commit=$(_gitLogOneline | fzf --ansi --tac --no-sort --no-multi) &&
        git checkout $(echo "${commit}" | sed "s/ .*//")
}

function git_commit_finder() {
    _gitLogOneline |
        fzf --ansi \
            --no-sort \
            --tiebreak=index \
            --layout=reverse \
            --header="F1: toggle preview, alt-enter: show diff, ctrl+c: copy commit hash" \
            --preview="git show --oneline --color=always {1} | delta" \
            --preview-window="top:50%" \
            --bind="F1:toggle-preview" \
            --bind="alt-enter:execute:git show {1} | delta" \
            --bind="ctrl-c:execute-silent(wl-copy {1})+accept"
}
