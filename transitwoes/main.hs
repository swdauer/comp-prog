main = do
    contents <- getContents
    let parsedLines = map parseLine $ lines contents
        start = head . head $ parsedLines
        classTime = head . tail . head $ parsedLines
        startPlusd0 = increment classTime (head . head . tail $ parsedLines) $ pure start
        ds = tail . head . tail $ parsedLines
        bs = head . tail . tail $ parsedLines
        cs = head . tail . tail . tail $ parsedLines
        cases = zip3 bs cs ds
    putStrLn $ printable $ foldl (\acc casei -> casei acc) startPlusd0 $ map (carryOutCase classTime) cases

parseLine :: String -> [Int]
parseLine line = do
    (x, rest) <- reads line :: [(Int, String)]
    x : parseLine rest

increment :: Int -> Int -> Maybe Int -> Maybe Int
increment _ _ Nothing                    = Nothing
increment classTime toAdd (Just current) | current + toAdd > classTime = Nothing
                                         | otherwise = Just $ current + toAdd

carryOutCase :: Int -> (Int, Int, Int) -> Maybe Int -> Maybe Int
carryOutCase _ _ Nothing                           = Nothing
carryOutCase classTime (bi, ci, di) current =
    let ai = fmap (`mod` ci) current
        Just ciToAdd =
            if fmap (== 0) ai == Just True then Just 0
            else fmap (ci -) ai
    in
    increment classTime di .
    increment classTime bi .
    increment classTime ciToAdd $ current

printable :: Maybe Int -> String
printable Nothing = "no"
printable _       = "yes"
