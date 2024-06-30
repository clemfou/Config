# enable vim mode
bindkey -v
# unbind Ctrl + T
bindkey -r "^t" 

# Ctrl + LEFT | RIGHT
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# Ctrl +
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" fzf-file-widget
bindkey "^k" kill-whole-line

bindkey -M vicmd ! zle-prepend-sudo
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

for km in viopp visual; do
    bindkey -M $km -- '-' vi-up-line-or-history

    for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
        bindkey -M $km $c select-quoted
    done

    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done
