BEGIN { RS = "\n\\.\\.\\.\n+"; FS = "\n" }
{
    if (NR == 1) {
        x = "---"
        for (i = 2; i <= NF; i++) {
            if (match($i, /^category:/)) ;
            else if (match($i, /^lang:/)) ;
            else if (match($i, /^footer:/)) ;
            else x = x "\n" $i
        }
        print x "\n...\n"
        RS = "\n"; FS = " "
    } else print $0
}
