# Make sure home directories are created so `stow` link only internals instead
# of entire directories
home_dirs=(
    .local
    .ssh
)

for home_dir_item in ${home_dirs[@]}; do
    local home_dir_path="$HOME/$home_dir_item"

    if [ ! -d "$home_dir_path" ]; then
        mkdir -p $home_dir_path
    fi
done
