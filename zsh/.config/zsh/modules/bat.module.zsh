function _init_bat {
    if command -v bat &>/dev/null; then
        local config=$(bat --config-file)

        # Check if custom config exists
        if [ ! -f "$config" ]; then
            return
        fi

        local theme_name=$(grep "^--theme" "$config" | cut -d '=' -f2)

        # Check if custom config exists
        if [ -z "$theme_name" ]; then
            return
        fi

        # Check if theme is available
        if ! bat --list-themes | grep -q $theme_name; then
            bat cache --build
        fi
    fi

    unfunction _init_bat
}

_init_bat
