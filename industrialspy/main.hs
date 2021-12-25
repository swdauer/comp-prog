module Main where

import           Data.Array (Array, array, (!), (//))
import           Data.Ix    (range)
import           Data.List  (permutations, subsequences)

data TriBool = Neither | T | F deriving (Eq, Show)

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

solve :: [String] -> ShowS
solve = shows . map allPerms

initMemo :: Array Int TriBool
initMemo = (//) memo $ zip [0..24] $ [F,F,T,T] ++ map (\q -> if even q || (q `mod` 3) == 0 then F else T) [4..24]
    where memo = array (0,9999999) [(i,Neither :: TriBool) | i <- range (0,9999999)]

allPerms :: String -> [Int]
allPerms = map (read :: (String -> Int)) . foldr (\x y -> if null x then y else permutations x ++ y) [] . subsequences

writeOutput :: ShowS -> String
writeOutput s = s "\n"
