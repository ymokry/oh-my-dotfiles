say() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

err() {
    say "Error: $1" >&2
    exit 1
}
