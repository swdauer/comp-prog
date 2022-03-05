main = do
    getLine
    conductCases [] 0 >>= mapM_ putStrLn

conductCases :: [String] -> Int -> IO [String]
conductCases _ 12 = return []
conductCases memo place = do
    line <- getLine
    let university = head . words $ line
    if university `elem` memo
        then conductCases memo place
        else do
            current <- conductCases (university:memo) (place+1)
            return (line:current)

