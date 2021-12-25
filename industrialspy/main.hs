module Main where

import           Data.List (permutations, subsequences)

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

solve :: [String] -> ShowS
solve = shows

allPerms :: String -> [Int]
allPerms = map (read :: (String -> Int)) . foldr (\x y -> if x == [] then y else permutations x ++ y) [] . subsequences

writeOutput :: ShowS -> String
writeOutput s = s "\n"
