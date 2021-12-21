module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

solve :: [String] -> ShowS
solve input = shows (constructSieve 10000000)

constructSieve :: Int -> [Int]
constructSieve n = sieve [2..n]

sieve :: [Int] -> [Int]
sieve []     = []
sieve (x:xs) = (:) x $ sieve $ removeMultN x x xs

removeMultN :: Int -> Int -> [Int] -> [Int]
removeMultN _ _ [] = []
removeMultN n curr (x:xs) | x == curr = removeMultN n (curr + n) xs
                          | x > curr = removeMultN n (curr + n) (x:xs)
                          | otherwise = x : removeMultN n curr xs

writeOutput :: ShowS -> String
writeOutput s = s "\n"
