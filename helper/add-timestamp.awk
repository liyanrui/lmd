BEGIN { RS = "\n\\.\\.\\.\n+" }
{
    if (NR == 1) {
        gsub(/\n[ \t]*date:[^\n]*/, "", $0)
        print $0
        if (date) print "date: " date
        print "...\n"
        RS = "\n"
    } else print $0
}
