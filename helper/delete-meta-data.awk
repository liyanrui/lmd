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
        print $0
        beginning = 0
        meta_data = 0
        next
    }
    if (meta_data) {
        if (match($0, /^category:/)) next
        if (match($0, /^lang:/)) next
        if (match($0, /^footer:/)) next
        print $0
    } else print $0
}
