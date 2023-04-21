{
    if (match($0, "^title: *(.*) *$", s)) {
        print s[1]
        exit 0
    }
}    
