{
    if (match($0, /^ *title:.*$/)) {
        s = $0
        sub(/ *title: */, "", s)
        sub(/ *$/, "", s)
        print s
        exit 0
    }
}
