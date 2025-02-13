/\[[^\]]*\]\(.*\)/ {
    s = $0
    sub(/.*\[[ \t]*/, "", s)
    sub(/[ \t]*\].*/, "", s)
    if (s == title) {
        print "true"
        exit 0
    }
}
