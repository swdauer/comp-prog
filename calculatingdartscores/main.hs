data Dart a b = Dart a b

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> Int
readInput s = read s

solve :: Int -> [Dart String Int]
solve x = (Dart "test" x) : []

writeOutput :: [Dart String Int] -> String
writeOutput xs = (unlines . (map (\(Dart x y) -> (show x) ++ " " ++ (show y)))) xs

-- generateSingleDarts :: [Dart String Int] -> [Int] -> [Dart String Int]
-- generateSingleDarts darts [] = darts 
-- generateSingleDarts darts (score:scores) = generateSingleDarts darts scores !! scores

generatePossScores :: [Dart String Int]
generatePossScores = (removeDups . quicksort) (map (Dart "single") [1..20]
                   ++ map (Dart "double") [1..20]
                   ++ map (Dart "triple") [1..20])

value :: Dart String Int -> Int
value (Dart x y) | x == "single" = y
                 | x == "double" = 2 * y
                 | otherwise = 3 * y

quicksort :: [Dart String Int] -> [Dart String Int]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, value (y) < value (x)]
                 ++ (x : quicksort [y | y <- xs, value (y) >= value (x)])

removeDups :: [Dart String Int] -> [Dart String Int]
removeDups [] = []
removeDups (x:[]) = x:[]
removeDups (x:y:xs) | value (x) == value (y) = removeDups (x:xs)
                    | otherwise = x:removeDups (y:xs)

instance Show (Dart String Int) where
    show (Dart x y) = show x ++ " " ++ show y
