import           Data.Char

main = getLine >>= print . (\x -> if x `mod` 11 == 0 then 1 else 0) . foldl (\acc val -> uncurry (*) val + acc) 0 . zip multipliers . toInts

multipliers = [4,3,2,7,6,5,4,3,2,1]

toInts :: String -> [Int]
toInts []       = []
toInts ('-':xs) = toInts xs
toInts (x:xs)   = digitToInt x : toInts xs
