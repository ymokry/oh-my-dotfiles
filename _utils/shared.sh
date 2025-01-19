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

    case "$os" in
        Darwin)     echo "mac"                  ;;
        Linux)      echo "rpi"                  ;;
        *)          err "Unknown host detected" ;;
    esac
}

get_package_manager() {
    local host=$(get_host)

    case "$host" in
        mac)    echo "brew"                 ;;
        rpi)    echo "apt"                  ;;
        *)      err "Unknown host detected" ;;
    esac
}

is_root_user() {
    if [[ "$(whoami)" = *"root"* ]]; then
        return 0
    else
        return 1
    fi
}

is_gui_env() {
    if [ "$(get_host)" = "mac" ]; then
        return 0
    else
        return 1
    fi
}
