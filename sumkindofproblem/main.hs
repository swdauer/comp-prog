main = do
    getLine
    contents <- getContents
    mapM_ (putStrLn . calculateCase . parseCase) $ lines contents

parseCase :: String -> (String, Int)
parseCase line = let split = words line
                 in (head split, read . head . tail $ split)

calculateCase :: (String, Int) -> String
calculateCase (k, n) =
    let sumN = sumFirstNInt n
    in k ++ " " ++ show sumN ++ " " ++ (show . sumFirstNOddInt $ n) ++ " " ++ show (2 * sumN)

sumFirstNInt :: Int -> Int
sumFirstNInt n = n * (n + 1) `div` 2

sumFirstNOddInt :: Int -> Int
sumFirstNOddInt n = n * n
