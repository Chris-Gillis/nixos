eval "$(zoxide init --cmd cd zsh)"

autoload -U compinit && compinit

# Start a zellij session if it hasn't been started yet
export ZELLIJ_AUTO_ATTACH=true
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
