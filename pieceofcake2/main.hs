main = do
    line <- getLine
    let (side,line') = head $ reads line :: (Int, String)
        (cut, line'') = head $ reads line' :: (Int, String)
        (cut', _) = head $ reads line'' :: (Int, String)
    print $ maxSide side cut' * maxSide side cut * 4

maxSide :: Int -> Int -> Int
maxSide side cut = max cut $ side - cut
