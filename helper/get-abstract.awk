/^ *abstract:.*$/ {
    s = $0
    sub(/[ \t]*abstract:[ \t]*/, "", s)
    sub(/[ \t]*$/, "", s)
    print s
    exit 0
}
