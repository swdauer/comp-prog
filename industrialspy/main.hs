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
sieve (x:xs) = x : sieve (filter (\y -> y `mod` x /= 0) xs)

writeOutput :: ShowS -> String
writeOutput s = s "\n"
