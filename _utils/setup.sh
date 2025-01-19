source $OMD/_utils/shared.sh

OMD_SETUP_FLAG="$OMD_CACHE/.setup_history"

create_setup_flag() {
    echo "$(get_host) $(timestamp)" > $OMD_SETUP_FLAG
}

check_setup_flag() {
    if [ -f "$OMD_SETUP_FLAG" ]; then
        return 1
    else
        return 0
    fi
}
