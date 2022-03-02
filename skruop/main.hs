main = getContents >>= print . foldl performOp 7 . tail . lines

turnUp :: Int -> Int
turnUp x | x < 10 = x + 1
         | otherwise = x

turnDown :: Int -> Int
turnDown x | x > 0 = x - 1
           | otherwise = x

performOp :: Int -> String -> Int
performOp x (_:_:_:_:_:c:_) | c == 'o' = turnUp x
                            | otherwise = turnDown x
