main = do
    line <- getLine
    let capacity = maxCapacity . getGT $ line
    line2 <- getLine
    let items = parseItems line2
    print $ capacity - sum items

getGT :: String -> [(Int, Int)]
getGT line = do
    (g, rest) <- reads line
    (t, _) <- reads rest
    return (g, t)

maxCapacity :: [(Int, Int)] -> Int
maxCapacity [(g, t)] = ((g - t) `div` 10) * 9

parseItems :: String -> [Int]
parseItems "" = []
parseItems line =
    let (item, rest) = head $ reads line :: (Int, String)
    in item : parseItems rest
