main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [Int]
readInput str = (tail . (map read) . words) str

solve :: [Int] -> Int
solve xs = greedyStep [] xs

greedyStep :: [Int] -> [Int] -> Int
greedyStep [] [] = 0
greedyStep [] (x:xs) = greedyStep [x] xs
greedyStep xs [] = length xs
greedyStep (x:xs) (y:ys) | even x == even y = greedyStep xs ys
                         | otherwise = greedyStep (y:x:xs) ys

writeOutput :: Int -> String
writeOutput x = ((\y -> y ++ "\n")  . show) x
