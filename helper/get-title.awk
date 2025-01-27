/^ *title:.*$/ {
    s = $0
    sub(/[ \t]*title:[ \t]*/, "", s)
    sub(/[ \t]*$/, "", s)
    print s
    exit 0
}
