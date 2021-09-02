main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> (String, String)
readInput s = (listToTuple . lines) s

listToTuple :: [String] -> (String, String)
listToTuple (x:y:[]) = (x, y)

solve :: (String, String) -> (String, String)
solve (x, y) | a == "" = ("YODA", (show . holdRead) b)
             | b == "" = ((show . holdRead) a, "YODA")
             | otherwise = ((show . holdRead) a, (show . holdRead) b)
            where (a, b) = newNums (reverse x) (reverse y) "" ""

holdRead :: String -> Int
holdRead s = read s

writeOutput :: (String, String) -> String
writeOutput (x, y) = x ++ "\n" ++ y ++ "\n"

newNums :: String -> String -> String -> String -> (String, String)
newNums [] [] xs2 ys2 = (xs2, ys2)
newNums [] ys xs2 ys2 = (xs2, reverse ys ++ ys2)
newNums xs [] xs2 ys2 = (reverse xs ++ xs2, ys2)
newNums (x:xs) (y:ys) xs2 ys2 | x > y = newNums xs ys (x:xs2) ys2
                              | y > x = newNums xs ys xs2 (y:ys2)
                              | otherwise = newNums xs ys (x:xs2) (y:ys2)