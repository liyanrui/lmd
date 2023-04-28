BEGIN {
    first_one = 1
    in_metadata = 0
    before_text = 0
    text = 0
    insert_it = 0
    other = 0
    post = "* [" title "]" "(output/" category "/" html_file ")"
    if (abstract) {
        post = post "：" abstract
    }
}
{
    if (first_one && $0 ~ /^--- *$/) {
        print $0
        in_metadata = 1
        next
    }
    if (first_one && $0 ~ /^\.\.\. *$/) {
        print $0
        in_metadata = 0
        before_text = 1
        first_one = 0
        next
    }
    if (in_metadata) {
        print $0
        next
    }
    if (before_text) {
        if ($0 ~ /^ *$/) {
            print $0
            next
        } else {
            before_text = 0
            insert_it = 1
        }
    }
    if (insert_it) {
        print post
        other = 1
    }
    if (other) {
        match($0, /^\* *\[(.*)\](.*) *：/, s)
        other_title = s[1]
        if (other_title == title) {
        } else {
            print $0
        }
    }
}
END {
    if (!insert_it) {
        print post
    }
}
