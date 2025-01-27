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
        if (category) print "category: " category
        if (lang) print "lang: " lang
        if (footer) print "footer: " footer
        print $0
        beginning = 0
        meta_data = 0
        next
    }
    print $0
}
