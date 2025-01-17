# https://github.com/Homebrew/homebrew-command-not-found

function cnf_init() {
    if (( $+commands[brew] )); then
        local chf_handler="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"

        if [ -f "$chf_handler" ]; then
            source $chf_handler
        fi
    fi
    unfunction cnf_init
}

cnf_init
