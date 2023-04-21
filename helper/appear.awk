BEGIN {
    i = 0; in_metadata = 0; after_metadata = 0;
}
{
    if ($0 ~ /^--- *$/ && i == 0) {
        in_metadata = 1
    }
    if ($0 ~ /^\.\.\. *$/ && i == 0) {
        in_metadata = 0
        after_metadata = 1
        i++
    }
    if (after_metadata) {
        print "...\n"
        new_post = "* [" title "]" "(output/" category "/" html_file ")：" abstract
        no_repeat[title]++
        print "* [" title "]" "(output/" category "/" html_file ")：" abstract
        after_metadata = 0
    } else {
        match($0, /^\* *\[(.*)\](.*) *：/, s)
        other_title = s[1]
        if (!no_repeat[other_title]) {
            if ($0 !~ /^$/) {
                print $0
            }
        }
    }
}
