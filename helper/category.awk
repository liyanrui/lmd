BEGIN {
    first_one = 1
}
{
    if (first_one && $0 ~ /^category: .*$/) {
        print "category: " category
        first_one = 0
    } else {
        print $0
    }
}
