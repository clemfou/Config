eval "$(dircolors)"
eval "$(pyenv init -)"

EXIT_CODE_ERR_ICON=$(echo -ne "\uf513")
PROMPT_END_CHARACTER=$(echo -ne "\u00BB")

AHEAD_ICON=$(echo -ne "\uf148")
BEHIND_ICON=$(echo -ne "\uf149")
BRANCH_ICON=$(echo -ne "\uf126")
REBASE_ICON=$(echo -ne "\uf47f")
STAGED_ICON=$(echo -ne "\uf055")
STASH_ICON=$(echo -ne "\ueb4b")
UNSTAGED_ICON=$(echo -ne "\uf059")

for config_file in ${XDG_CONFIG_HOME}/zsh/conf.d/*;
do
    source "${config_file}"
done

unset config_file

source <(fzf --zsh)
