module Main where

readInput :: String -> [String]
readInput = tail . lines

writeOutput :: [Int] -> String
writeOutput = unlines . map show

main :: IO ()
main = interact(writeOutput . solve . readInput)

solve :: [String] -> [Int]
solve = map (pebbleCount)

pebbleCount :: String -> Int
pebbleCount = foldl (\x c -> if c == 'o' then x + 1 else x) 0

minOr1 :: [Int] -> Int -> Int
minOr1 (1:xs) _ = 1
minOr1 [] currMin = currMin
minOr1 (x:xs) currMin | x < currMin = minOr1 xs x
                      | otherwise = minOr1 xs currMin

descendants :: String -> [String]
descendants (x:y:[]) = (x:y:""):[]
descendants ('o':'o':'-':xs) = ('-':'-':'o':xs):((map (\v -> 'o':'o':v) . descendants) ('-':xs))
descendants ('-':'o':'o':xs) = ('o':'-':'-':xs):((map ('-':) . descendants) ('o':'o':xs))
descendants (x:y:z:xs) = (map (x:) . descendants) (y:z:xs)
