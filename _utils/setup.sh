source $OMC/_utils/shared.sh

OMC_SETUP_FLAG="$OMC/.setup_history"

create_setup_flag() {
    echo "$(get_host) $(timestamp)" > $OMC_SETUP_FLAG
}

check_setup_flag() {
    if [ -f "$OMC_SETUP_FLAG" ]; then
        return 1
    else
        return 0
    fi
}
