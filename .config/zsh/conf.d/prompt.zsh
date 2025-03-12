ASYNC_PROC=0

typeset -g GIT_STATES

function git_stashes_count() {
    local stashes
    stashes=$(
        git rev-list --walk-reflogs --ignore-missing --count refs/stash
    )

    [[ ${stashes} != 0 ]] && \
        GIT_STATES+=(${stashes:+%F{220} %f${stashes}})
}

function git_is_worktree() {
    local common_dir
    common_dir=$(git rev-parse --git-common-dir 2>/dev/null)

    [[ ! ${common_dir} =~ "^\." ]] && \
        GIT_STATES+=("") || GIT_STATES+=("")
}

function git_is_head_detached() {
    local status_output=${1}

    if [[ ${status_output#*$'\n'} =~ "^# branch.head \(detached\)" ]]; then
        local detached_head_hash

        detached_head_hash=$(git rev-parse --short HEAD)
        GIT_STATES+=(" (detached HEAD) [%F{184}${detached_head_hash}%f]")
    fi
}

function git_check_for_detached_head() {
    local status_output

    status_output=$(git status --porcelain=v2 --branch 2>/dev/null)
    git_is_head_detached ${status_output}
}

function git_has_active_rebase() {
    local git_dir=${1}

    if [[ -d "${git_dir}/rebase-merge" ]]; then
        local rebase_onto_hash 
        rebase_onto_hash=$(cat "${git_dir}/rebase-merge/onto")

        GIT_STATES+=(" %F{196}${rebase_onto_hash:0:7}%f")

        return 0
    fi

    return 1
}

function git_truncate_branch_name() {
    local branch_name=${1}
    local branch_number=${branch_name%%-*}

    [[ ${branch_number} =~ ^[0-9]+$ ]] && \
        echo "${branch_number}-…" || echo ${branch_name}
}

function git_display_branch_info() {
    local branch_name git_dir

    raw_branch_name=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    [[ ${?} != "0" ]] && \
        GIT_STATES+=("No commit yet") && \
        return

    git_is_worktree

    if [[ ${raw_branch_name} != "HEAD" ]]; then
        truncated_branch_name=$(git_truncate_branch_name ${raw_branch_name})

        GIT_STATES+=(
            ${truncated_branch_name:+%F{32}${truncated_branch_name}%f}
        )
    else
        git_dir=$(git rev-parse --git-dir 2>/dev/null)

        if ! git_has_active_rebase ${git_dir}; then
            git_check_for_detached_head
        fi
    fi
}

function git_working_dir_status() {
    local staged unstaged untracked ignored

    git_status_output=$(
        git status --porcelain=v2 --ignored=traditional 2>/dev/null
    )

    while read -r line; do
        [[ -z ${line} ]] && continue

        case ${line:0:1} in
            "!")
                ((ignored++))

                ;;
            "?")
                ((untracked++))

                ;;
            "1")
                local x=${line:2:1}
                local y=${line:3:1}

                [[ ${x} != "." ]] && ((staged++))
                [[ ${y} != "." || ${y} == " " ]] && ((unstaged++))

                ;;
            "2")
                ((staged++, unstaged++))

                ;;
        esac
    done <<< ${git_status_output}

    GIT_STATES+=(${staged:+%F{84}%f ${staged}})
    GIT_STATES+=(${unstaged:+%F{100}%f ${unstaged}})
    GIT_STATES+=(${untracked:+%F{196}%f ${untracked}})
    GIT_STATES+=(${ignored:+󰊠 ${ignored}})
}

function git_ahead_behind_count() {
    local remote ahead behind

    remote=${$(git rev-parse --verify ${hook_com[branch]}@{u} \
        --symbolic-full-name 2> /dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]]; then
        IFS=$'\t' read -r ahead behind <<<"$(git rev-list \
            --left-right --count HEAD...@{u})"

        (( ahead )) && GIT_STATES+=("%F{32}${ahead}%f")
        (( behind )) && GIT_STATES+=("%F{32}${behind}%f")
    fi
}

function build_prompt() {
    local prompt_output=""
    local top=() bottom=()

    top+=("%F{245}%3~%f")
    bottom+=("%(?..[%?] )%F{32}%n%f %# ")

    [ ${PWD} != ${HOME} ] \
        && prompt_output+="${top}"$'\n'

    prompt_output+=${bottom[@]}
    PROMPT=${prompt_output}
}

function parse_git_status() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        git_display_branch_info
        git_ahead_behind_count
        git_working_dir_status
        git_stashes_count

        echo ${(j: :)GIT_STATES}
    fi
}

function precmd_hook() {
    function async() {
        printf "%s" "$(parse_git_status)" > "/tmp/zsh_prompt_$$"

        kill -s USR1 $$
    }

    [[ ${ASYNC_PROC} != 0 ]] && \
        kill -s HUP ${ASYNC_PROC} >/dev/null 2>&1 || :

    async &!
    ASYNC_PROC=$!
}

function TRAPUSR1() {
    RPROMPT=$(</tmp/zsh_prompt_$$)
    ASYNC_PROC=0

    zle && zle reset-prompt
}

function zle-keymap-select {
    case ${KEYMAP} in
        vicmd)
            # cursor in block mode
            echo -ne "\e[1 q"
            POSTDISPLAY=$'\n -- command mode --'
            ;;
        *)
            # cursor in beam mode
            echo -ne "\e[5 q"
            POSTDISPLAY=
            ;;
    esac
}

zle -N zle-keymap-select

autoload -Uz add-zsh-hook

add-zsh-hook precmd build_prompt 
add-zsh-hook precmd precmd_hook
