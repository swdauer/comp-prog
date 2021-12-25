module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

solve :: [String] -> ShowS
solve = shows

writeOutput :: ShowS -> String
writeOutput s = s "\n"
