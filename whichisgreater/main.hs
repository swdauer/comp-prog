main = getLine >>= print .
    (\x -> if head x > x !! 1 then 1 else 0) .
    map (read :: String -> Int) .
    words
