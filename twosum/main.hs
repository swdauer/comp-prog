main = do
    line <- getLine
    let (a, rest) = head . reads $ line
        (b, _) = head . reads $ rest
    print (a + b)
