type Dart = (String, Int)

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> Int
readInput s = read s

solve :: Int -> (Bool, [Dart])
solve x = ("test", x) : []

writeOutput :: (Bool, [Dart]) -> String
writeOutput (True, xs) = (unlines . (map (\(x, y) -> (show x) ++ " " ++ (show y)))) xs
writeOutput (False, _) = "impossible\n"

-- First Int is the dart num
-- Second Int is the score wanted
-- [Dart] is generatePossScores
isPossible :: Int -> Int -> [Dart] -> (Bool, [Dart])
isPossible _ 0 _ = (True, [])
isPossible x y darts | x == 3 = (False, [])
                     | outcome = 
                     where (outcome, accum) = isPossible (x+1) -- NOT FINISHED

generatePossScores :: [Dart]
generatePossScores = (removeDups . quicksort) (map (\x -> ("single", x)) [1..20]
                   ++ map (\x -> ("double", x)) [1..20]
                   ++ map (\x -> ("triple", x)) [1..20])

value :: Dart -> Int
value (x, y) | x == "single" = y
             | x == "double" = 2 * y
             | otherwise = 3 * y

quicksort :: [Dart] -> [Dart]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, value y < value x]
                 ++ (x : quicksort [y | y <- xs, value y >= value x])

removeDups :: [Dart] -> [Dart]
removeDups [] = []
removeDups (x:[]) = x:[]
removeDups (x:y:xs) | value x == value y = removeDups (x:xs)
                    | otherwise = x:removeDups (y:xs)
