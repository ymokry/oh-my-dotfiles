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

        # Replace default 'find' command used to 'fzf'
        export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

        # Use 'fd' (https://github.com/sharkdp/fd) for listing path candidates.
        # - The first argument to the function ($1) is the base path to start traversal
        # - See the source code (completion.{bash,zsh}) for the details.
        _fzf_compgen_path() {
            fd --hidden --follow --exclude ".git" . "$1"
        }

        # Use 'fd' to generate the list for directory completion
        _fzf_compgen_dir() {
            fd --type d --hidden --follow --exclude ".git" . "$1"
        }

        # Reusable function to preview file or directory
        show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

        # Better previews
        export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
        export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head - 200'"

        # Advanced customization of 'fzf' options via _fzf_comprun function
        # - The first argument to the function is the name of the command.
        # - You should make sure to pass the rest of the arguments ($@) to fzf.
        _fzf_comprun() {
            local command=$1
            shift

            case "$command" in
                cd)           fzf --preview 'eza --tree --color=always {} | head -200'      "$@" ;;
                export|unset) fzf --preview "eval 'echo \$'{}"                              "$@" ;;
                ssh)          fzf --preview 'dig {}'                                        "$@" ;;
                *)            fzf --preview '$show_file_or_dir_preview'    "$@" ;;
            esac
        }

        eval "$(fzf --zsh)"
    fi
    unfunction _init_fzf
}

_init_fzf
