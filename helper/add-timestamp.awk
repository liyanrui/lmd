BEGIN {
    beginning = 1
    meta_data = 0
}
{
    if (beginning && $0 ~ /^--- *$/) {
        print $0
        meta_data = 1
        next
    }
    if (meta_data && $0 ~ /^\.\.\. *$/) {
        if (date) print "date: " date
        beginning = 0
        meta_data = 0
        # 略过原有的时间戳
        if (!match($0, /^date:/)) print $0
        next
    }
    print $0
}
