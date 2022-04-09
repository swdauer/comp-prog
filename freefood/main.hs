main = do
    getLine



parseInterval :: String -> (Int, Int)
parseInterval line =
    let (x:y:_) = map read $ words line
    in (x, y)
