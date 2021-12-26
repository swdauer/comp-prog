module Main where

import           Data.Array (Array, array, (!), (//))
import           Data.Ix    (range)
import           Data.List  (permutations, subsequences)

data TriBool = M | Y | N deriving (Eq, Show)

type Memo = Array Int TriBool

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

solve :: [String] -> ShowS
solve = shows . map allPerms

initMemo :: Memo
initMemo = (//) memo $ zip [0..24] $ [N,N,Y,Y] ++ map (\q -> if even q || (q `mod` 3) == 0 then N else Y) [4..24]
    where memo = array (0,9999999) [(i,M :: TriBool) | i <- range (0,9999999)]

allPerms :: String -> [Int]
allPerms = map (read :: (String -> Int)) . foldr (\x y -> if null x then y else permutations x ++ y) [] . subsequences

countPrimes :: (Memo, Int) -> [Int] -> (Memo, Int)
countPrimes (memo, cnt) [] = (memo, cnt)
countPrimes (memo, cnt) (n:nums) | memo!n == Y = countPrimes (memo, cnt+1) nums
                                 | memo!n == N = countPrimes (memo, cnt) nums
                                 | otherwise = let prime = isPrime n
                                               in if prime
                                                  then countPrimes (memo//[(n,Y)], cnt+1) nums
                                                  else countPrimes (memo//[(n,N)], cnt) nums

isPrime :: Int -> Bool
isPrime toCheck | even toCheck || toCheck `mod` 3 == 0 = False
                | otherwise = divisorCheck toCheck 5

divisorCheck :: Int -> Int -> Bool
divisorCheck toCheck divisor | toCheck `mod` divisor == 0 || toCheck `mod` (divisor+2) == 0 = False
                             | divisor*divisor <= toCheck = divisorCheck toCheck $ divisor+6
                             | otherwise = True

writeOutput :: ShowS -> String
writeOutput s = s "\n"
