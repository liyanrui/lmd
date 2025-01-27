{
    if (match($0, /^\*[ \t]*\[[^\]]*\]\(.*\)/)) {
        s = $0
        sub(/^\*[ \t]*\[[ \t]*/, "", s)
        sub(/[ \t]*\].*$/, "", s)
        if (s != title) print $0
    } else print $0
}
