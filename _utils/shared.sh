timestamp() {
    echo $(date '+%Y-%m-%d %H:%M:%S')
}

say() {
    echo "[$(timestamp)] $1"
}

err() {
    say "Error: $1" >&2
    exit 1
}

get_host() {
    local os=$(uname)

    if [ "$os" = "Darwin" ]; then
        echo "machine"
    elif [ "$os" = "Linux" ]; then
        echo "satellite"
    else
        err "Unknown host detected"
    fi
}

is_root_user() {
    if [[ ! "$(whoami)" = *"root"* ]]; then
        return 1
    else
        return 0
    fi
}

is_gui_env() {
    if [ "$(get_host)" != "machine" ]; then
        return 1
    else
        return 0
    fi
}
