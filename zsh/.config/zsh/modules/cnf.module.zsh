# https://github.com/Homebrew/homebrew-command-not-found

function _init_cnf() {
    if command -v brew &>/dev/null; then
        local cnf_handler="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"

        if [ -f "$cnf_handler" ]; then
            source $cnf_handler
        fi
    fi
    unfunction _init_cnf
}

_init_cnf
