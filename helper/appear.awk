BEGIN {
    first_one = 1
    in_metadata = 0
    before_text = 0
    finished = 0
    post = "* [" title "]" "(" relative_path "/" html_file ")"
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
    if (first_one && in_metadata) {
        print $0
        next
    }
    if (before_text) {
        if ($0 ~ /^ *$/) {
            print $0
            next
        } else {
            print post
            before_text = 0
            finished = 1
        }
    }
    if (finished) {
        match($0, /^\* *\[(.*)\]\(.*\)/, s)
        other_title = s[1]
        if (other_title != title) {
            print $0
        }
    }
}
END {
    if (!finished) {
        print post
    }
}
