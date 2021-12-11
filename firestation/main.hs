module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = lines

solve :: [String] -> [String]
solve x = x

writeOutput :: [String] -> String
writeOutput x = shows x "\n"
