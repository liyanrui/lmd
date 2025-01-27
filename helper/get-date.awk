/^ *date:.*$/ {
    s = $0
    sub(/[ \t]*date:[ \t]*/, "", s)
    sub(/[ \t]*$/, "", s)
    print s
    exit 0
}
