main = do
    line <- getLine
    let pair = parsePair line
        b = head pair
        h = head $ tail pair
    print $ b * h / 2


parsePair :: String -> [Double]
parsePair line = do
    (x, rest) <- reads line :: [(Double, String)]
    x : parsePair rest
