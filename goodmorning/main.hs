readInput :: String -> [Int]
readInput = tail . (map read) . words

writeOutput :: [Int] -> String
writeOutput = unlines . (map show)

-- possibleValues :: [Int]

possibleValuePrefixN :: Int -> [Int]
possibleValuePrefixN n | n > 200 = []
                       | otherwise = 
                          n : (((concat) . (map possibleValuePrefixN)) . (map (add10x n)) (adjList !! (rem n 10)))
                            where adjList = 
                                    [ [0]
                                    , [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                                    , [0, 2, 3, 5, 6, 8, 9]
                                    , [3, 6, 9]
                                    , [0, 4, 5, 6, 7, 8, 9]
                                    , [0, 5, 6, 8, 9]
                                    , [6, 9]
                                    , [0, 7, 8, 9]
                                    , [0, 8, 9]
                                    , [9]]

add10x :: Int -> Int -> Int
add10x x y = x*10 + y

solve :: [Int] -> [Int] -> [Int]
solve _ [] = []

-- main :: IO ()
-- main = interact(writeOutput . (solve possibleValues) . readInput)
