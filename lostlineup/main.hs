import           Data.List
main = do
    getLine
    line <- getLine
    let nums = map (read :: String -> Int) $ words line
    putStrLn $ foldl (\acc (_, x) -> acc ++ " " ++ show x) "1" $ sortOn fst $ zip nums [2..]
