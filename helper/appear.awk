BEGIN {
    i = 0; in_metadata = 0; before_text = 0;
}
{
    if ($0 ~ /^--- *$/ && i == 0) {
        print $0
        in_metadata = 1
        next
    }
    if ($0 ~ /^\.\.\. *$/ && i == 0) {
        print $0
        in_metadata = 0
        before_text = 1
        i++
        next
    }
    if (before_text) {
        if ($0 ~ /^ *$/) {
            print $0
            next
        } else {
            new_post = "* [" title "]" "(output/" category "/" html_file ")：" abstract
            no_repeat[title]++
            print "* [" title "]" "(output/" category "/" html_file ")：" abstract
            before_text = 0
        }
    }
    match($0, /^\* *\[(.*)\](.*) *：/, s)
    other_title = s[1]
    if (!no_repeat[other_title]) {
        print $0
    }
}
