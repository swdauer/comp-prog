main = do
    getLine
    toKnowLine <- getLine
    knownLine <- getLine
    let toKnow = parseList toKnowLine
        known = parseList knownLine
        toLearn = foldr findAndRemove toKnow known
    print $ head toLearn

findAndRemove :: Int -> [Int] -> [Int]
findAndRemove y = filter (/= y)

parseList :: String -> [Int]
parseList line = do
    (x, rest) <- reads line
    x : parseList rest
