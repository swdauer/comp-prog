main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = tail . lines

writeOutput :: Int -> String
writeOutput i = show i ++ "\n"

solve :: [String] -> Int
solve = foldl (\x y -> x + read y - 1) 1
