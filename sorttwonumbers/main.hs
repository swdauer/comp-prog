main = do
    line <- getLine
    let pair = parsePair line
        x = head pair
        y = head $ tail pair
    if x < y
        then putStrLn $ shows x . (' ':) . shows y $ ""
        else putStrLn $ shows y . (' ':) . shows x $ ""

parsePair :: String -> [Int]
parsePair line = do
    (x, rest) <- reads line :: [(Int, String)]
    x : parsePair rest
