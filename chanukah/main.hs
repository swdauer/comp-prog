main = do
    contents <- getContents
    mapM_ (putStrLn . lineToOutput) $ tail . lines $ contents

sumFrom1ToNPN n = n + sumFrom1ToN n

sumFrom1ToN :: Int -> Int
sumFrom1ToN n = (n * (n+1)) `div` 2

lineToOutput :: String -> String
lineToOutput line =
    let splitLine = words line
        caseNum = head splitLine
        numCandles = sumFrom1ToNPN . (read :: (String -> Int)) . head . tail $ splitLine
    in caseNum ++ " " ++ show numCandles
