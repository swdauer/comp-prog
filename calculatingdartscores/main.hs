module Main where

type Dart = (String, Int)

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> Int
readInput = read

solve :: Int -> [Dart]
solve x | darts == [] = []
        | otherwise = head darts
        where darts = filter (\round -> foldl (\acc d -> acc + value d) 0 round == x) allRounds

writeOutput :: [Dart] -> String
writeOutput [] = "impossible"
writeOutput ds = (unlines . (map showDart)) ds

showDart :: Dart -> String
showDart (s, x) = s ++ (' ' : show x)

possibleScores :: [Dart]
possibleScores = [("single", x) | x <- [1..20]]
              ++ [("double", x) | x <- [11..20]]
              ++ [("triple", x) | x <- [7..20], rem x 2 /= 0 || 3*x > 40]

oneList :: [Dart] -> [[Dart]]
oneList ds = [[x] | x <- ds]

twoList :: [Dart] -> [[Dart]]
twoList ds = [[x, y] | x <- ds, y <- ds]

threeList :: [Dart] -> [[Dart]]
threeList ds = [[x, y, z] | x <- ds, y <- ds, z <- ds]

allRounds :: [[Dart]]
allRounds = let poss = possibleScores
            in oneList poss ++ twoList poss ++ threeList poss

value :: Dart -> Int
value (s, x) | s == "single" = x
             | s == "double" = 2 * x
             | otherwise = 3 * x
