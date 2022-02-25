main = do
    contents <- getContents
    let cases = map (numOutlets . tail . parseIntList) $ tail . lines $ contents
    mapM_ print cases

parseIntList :: String -> [Int]
parseIntList [] = []
parseIntList line =
    let (x, rest) = head $ reads line :: (Int, String)
    in x : parseIntList rest

numOutlets :: [Int] -> Int
numOutlets intList = 1 + foldl (\x acc -> x - 1 + acc) 0 intList
