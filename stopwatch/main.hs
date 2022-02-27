main = do
    content <- getContents
    let input = parseIntList content
    if head input `mod` 2 == 1 then putStrLn "still running"
    else do
        print $ findTime 0 $ tail input


parseIntList :: String -> [Int]
parseIntList content = do
    (x, rest) <- reads content :: [(Int, String)]
    x : parseIntList rest

findTime :: Int -> [Int] -> Int
findTime acc []                = acc
findTime acc (start:stop:rest) = findTime (acc + stop - start) rest
