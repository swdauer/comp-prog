main = do
    line <- getLine
    let (d1, rest) = head $ reads line :: (Int, String)
        (d2, _) = head $ reads rest :: (Int, String)
    mapM_ print $ mostProbableSums d1 d2

mostProbableSums :: Int -> Int -> [Int]
mostProbableSums d1 d2 | d1 > d2 = mostProbableSums d2 d1
                       | otherwise = [(d1+1)..(d2+1)]
