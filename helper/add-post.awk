BEGIN {
    item = "* [" title "](" post_path ")"
    metadata_beginning = 1
    in_metadata = 0
    before_text = 0
    finished = 0
}
{
    # 跳过文档首部 metadata
    if (metadata_beginning && $0 ~ /^--- *$/) {
        print $0
        in_metadata = 1
        metadata_beginning = 0
        next
    }
    if (in_metadata && $0 ~ /^\.\.\. *$/) {
        print $0
        in_metadata = 0
        before_text = 1
        next
    }
    if (in_metadata) {
        print $0
        next
    }
    if (before_text) {
        # 在正文区域遇到非空行，添加 post 链接
        if ($0 ~ /^[ \t]*$/) {
            print $0
        } else {
            print item
            finished = 1
            before_text = 0
        }
    }
    if (finished) print $0
}
END {
    # 以防页面内容为空
    if (!finished) print item
}
