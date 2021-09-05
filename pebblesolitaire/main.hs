module Main where

readInput :: String -> [String]
readInput s = take n (tail l)
            where l = lines s
                  n = (read . head) l

writeOutput :: [Int] -> String
writeOutput = unlines . map show

main :: IO ()
main = interact(writeOutput . solve . readInput)

solve :: [String] -> [Int]
solve = map (findMin 1000) . map (\s -> s:[])

pebbleCount :: String -> Int
pebbleCount = foldl (\x c -> if c == 'o' then x + 1 else x) 0

-- minOr1 :: [Int] -> Int -> Int
-- minOr1 (1:xs) _ = 1
-- minOr1 [] currMin = currMin
-- minOr1 (x:xs) currMin | x < currMin = minOr1 xs x
--                       | otherwise = minOr1 xs currMin

findMin :: Int -> [String] -> Int
findMin min [] = min
findMin min (x:xs) | curr == 1 = 1
                   | curr < min = findMin curr ((reverse . tail . reverse . descendants) x ++ xs)
                   | otherwise = findMin min ((reverse . tail . reverse . descendants) x ++ xs)
                   where curr = pebbleCount x

descendants :: String -> [String]
descendants (x:[]) = (x:""):[]
descendants (x:y:[]) = (x:y:""):[]
descendants ('o':'o':'-':xs) = ('-':'-':'o':xs):((map ('o':) . descendants) ('o':'-':xs))
descendants ('-':'o':'o':xs) = ('o':'-':'-':xs):((map ('-':) . descendants) ('o':'o':xs))
descendants (x:y:z:xs) = (map (x:) . descendants) (y:z:xs)
