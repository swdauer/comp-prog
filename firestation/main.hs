module Main where

import           Data.Array

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = lines

solve :: [String] -> ShowS
-- solve x = let squares = array (1,100) [(i, i ^ (2 :: Integer)) | i <- range (1,100)]
--           in shows (squares!7)
solve = shows

writeOutput :: ShowS -> String
writeOutput x = x "\n"
