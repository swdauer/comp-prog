main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [Int]
readInput s = (map read . words) s

solve :: [Int] -> [Int]
solve (a:b:c:d:xs) | a == b && a == c && a == d && a == 0 = []
                   | otherwise = (snd . clock d . counter c . clock b) (a, 360 * 3) : solve xs

clock :: Int -> (Int, Int) -> (Int, Int)
clock stop (start, runningTotal) | stop <= start = (stop, runningTotal + (start - stop) * 9)
                                 | otherwise = (stop, runningTotal + (start - stop + 40) * 9)

counter :: Int -> (Int, Int) -> (Int, Int)
counter stop (start, runningTotal) | stop >= start = (stop, runningTotal + (stop - start) * 9)
                                   | otherwise = (stop, runningTotal + (stop - start + 40) * 9)

writeOutput :: [Int] -> String
writeOutput xs = (unlines . map show) xs
