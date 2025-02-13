BEGIN { RS = "\n\\.\\.\\.\n+" }
{
    if (NR == 1) {
        print $0
        if (category) print "category:", category
        if (lang) print "lang:", lang
        if (footer) print "footer:", footer
        print "...\n"
        RS = "\n"
    } else print $0
}
