BEGIN {
    first_one = 1
    in_metadata = 0
    before_text = 0
    text = 0
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
            before_text = 0
            text = 1
        }
    }
    if (text) {
        if ($0 !~ /^ *$/) {
            if (match($0, /^\* *\[[^\]]*\]\(.*\)/)) {
                s = $0
                sub(/^\* *\[ */, "", s)     # 去除首部空白
                sub(/ *\]\(.*\).*$/, "", s) # 去除尾部空白
                if (s != title) print $0
                next
            }
        }
    }
}
END {
    print post
}
