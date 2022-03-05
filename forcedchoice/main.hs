main = do
    firstLine <- getLine
    let p = read . head . tail . words $ firstLine :: Int
    getContents >>=
        mapM_ (putStrLn . keepOrRemove p . parseLine) . lines

parseLine :: String -> [Int]
parseLine = tail . map read . words

keepOrRemove :: Int -> [Int] -> String
keepOrRemove p step = if p `elem` step then "KEEP" else "REMOVE"
