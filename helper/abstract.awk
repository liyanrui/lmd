{
    if (match($0, "^abstract: *(.*) *$", s)) {
        print s[1]
        exit 0
    }
}    
