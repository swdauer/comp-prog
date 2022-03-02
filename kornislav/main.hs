main = getLine >>= print . area . insertSort . parseList

-- assumes first list is sorted
insert :: [Int] -> Int -> [Int]
insert [] v = [v]
insert (x:xs) v | x < v = x : insert xs v
                | otherwise = v:x:xs

insertSort :: [Int] -> [Int]
insertSort = foldl insert []

parseList :: String -> [Int]
parseList line = do
    (x, rest) <- reads line
    x : parseList rest

-- assumes a sorted list of four Ints
area :: [Int] -> Int
area (x:_:y:_) = x * y
