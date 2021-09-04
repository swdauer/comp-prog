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
