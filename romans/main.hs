main = do
    line <- getLine
    let miles = read line :: Double
    print $ round $ miles * 1000 * 5280 / 4854
