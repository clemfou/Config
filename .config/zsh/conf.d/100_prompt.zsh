function prompt_status() {
    local symbols
    [[ $RETVAL -ne 0 ]] && symbols+="%F{160}${EXIT_CODE_ERR_ICON}%f"

    [[ -n $symbols ]] && prompt_segment "${symbols}"
}

function prompt_context() {
    prompt_segment "%F{32}%n%f@%m"
}

function prompt_directory() {
    prompt_segment "%3~"
}

function prompt_virtualenv() {
    if [[ -n "${VIRTUAL_ENV}" ]]; then
        prompt_segment "${VIRTUAL_ENV}"
    fi
}

function prompt_git() {
    local is_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

    if [ "${is_git_repo}" ]; then
        vcs_info

        prompt_segment "${vcs_info_msg_0_}"
    fi
}

function prompt_segment() {
    local SEGMENT_SEPARATOR=" "

    if [[ -n "${1}" ]]; then
        echo -n "${1}${SEGMENT_SEPARATOR}"
    fi
}

function prompt_end() {
    prompt_segment "%F{5}${PROMPT_END_CHARACTER}%f"
}

function build_prompt() {
    RETVAL=$?
    prompt_status
    prompt_context
    prompt_directory
    prompt_virtualenv
    prompt_git
    prompt_end
}

PROMPT='$(build_prompt)'
