{
    if (match($0, "^abstract: *.* *$")) {
        sub(/^abstract: */, "", $0) # 去除首部空白
        sub(/ *$/, "", $0) # 去除尾部空白
        print $0
        exit 0
    }
}    
