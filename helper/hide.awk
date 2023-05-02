{
    match($0, /^\* *\[([^\]]*)\](.*) *：/, s)
    other_title = s[1]
    if (title != other_title) {
            print $0
    }
}
