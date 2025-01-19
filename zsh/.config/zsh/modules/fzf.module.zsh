function _init_fzf() {
    if (( $+commands[fzf] )); then
        # Apply 'tokyonight_night' color theme
        # https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_night.sh
        export FZF_DEFAULT_OPTS='
            --layout=reverse
            --preview-window="border-rounded"
            --border="rounded"
            --info="right"
            --prompt="❱ "
            --marker="◆"
            --pointer="❱"
            --separator="─"
            --scrollbar="┃"
            --color=fg+:#c0caf5
            --color=fg:#c0caf5
            --color=query:#c0caf5
            --color=bg+:#283457
            --color=bg:#1a1b26
            --color=gutter:#1a1b26
            --color=hl:#2ac3de
            --color=hl+:#2ac3de
            --color=prompt:#2ac3de
            --color=marker:#ff007c
            --color=spinner:#ff007c
            --color=pointer:#ff007c
            --color=info:#545c7e
            --color=border:#27a1b9
            --color=scrollbar:#27a1b9
            --color=separator:#ff9e64
            --color=header:#ff9e64'

        export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

        # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
        # - The first argument to the function ($1) is the base path to start traversal
        # - See the source code (completion.{bash,zsh}) for the details.
        _fzf_compgen_path() {
            fd --hidden --follow --exclude ".git" . "$1"
        }

        # Use fd to generate the list for directory completion
        _fzf_compgen_dir() {
            fd --type d --hidden --follow --exclude ".git" . "$1"
        }

        eval "$(fzf --zsh)"
    fi
    unfunction _init_fzf
}

_init_fzf
