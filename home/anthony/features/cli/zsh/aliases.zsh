# Docker Compose
dc() {
    if [ -z "$1" ]; then
        docker compose
    else
        if [ "$1" = "full" ]; then
            shift
            docker compose -f docker-compose.yml -f docker-compose-ngrok.yml $@
        else
            docker compose $@
        fi
    fi
}

alias cat='bat'
alias pcat='bat --plain --color never'
alias ls='exa'
alias ll='exa -al'
alias top='btop'

alias sdf='ssh -t rufus@tty.sdf.org'
alias pt='porsmo'
alias speedtest='speedtest-rs'

alias fuck='doas `fc -n -l -1`'
