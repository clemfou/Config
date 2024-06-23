eval $(dircolors)

for config_file in "${XDG_CONFIG_HOME}"/zsh/conf.d/*;
do
    source "${config_file}"
done

unset config_file

[ -e /etc/os-release ] && source /etc/os-release

case $NAME in
    "Arch Linux")
        FZF_PATH=/usr/share/fzf
        ;;

    *)
        FZF_PATH=/usr/share/doc/fzf/examples
        ;;
esac

source ${FZF_PATH}/completion.zsh
source ${FZF_PATH}/key-bindings.zsh
