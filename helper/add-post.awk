BEGIN {
    RS = "\n\\.\\.\\.[ \t]*\n+"
    post_date = ""
    if (date) {
        post_date = "<span class=\"post-date\">" date "</span>"
    }
    item = "* [" title "](" post_path ")" post_date
}
{
    if (NR == 2) {
        print "...\n\n" item
        print $0
        RS = "\n"
    } else print $0
}
END {
    # 页面内容为空
    if (NR < 2) {
        print "...\n\n" item
    }
}
