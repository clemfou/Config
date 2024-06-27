eval $(dircolors)

for config_file in "${XDG_CONFIG_HOME}"/zsh/conf.d/*;
do
    source "${config_file}"
done

unset config_file

source <(fzf --zsh)
