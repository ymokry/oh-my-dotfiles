function _init_docker {
    # Set up `docker` completions if installed
    if command -v docker >/dev/null 2>&1; then
        local completions_path="$HOME/.docker/completions"

        # Make sure completuons are generated
        if [ ! -d "$completions_path" ]; then
            mkdir $completions_path

            docker completion zsh >$completions_path/_docker
        fi

        FPATH="$completions_path:$FPATH"
    fi

    unfunction _init_docker
}

_init_docker
