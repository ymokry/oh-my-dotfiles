source $OMC/_utils/shared.sh

link_config() {
    if ! command -v stow > /dev/null 2>&1; then
        err "'stow' is not installed or not in \$PATH"
    fi

    local user=$1
    local target=$2

    if [ -z "$user" ] || [ -z "$target" ]; then
        err "Both args required for 'stow' to link"
    fi

    # -v: Verbose, -R: Restow, -t: Target
    stow -v -R -t $user $target
}
