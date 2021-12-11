main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [(Integer, Integer)]
readInput = map (twoElemListToPair . words) . lines

twoElemListToPair :: [String] -> (Integer, Integer)
twoElemListToPair [x,y] = (read x, read y)

solve :: [(Integer, Integer)] -> String -> String
solve (x:xs) = let zs = sort xs
               in shows (findTotal 0 (snd x - 1) [] zs)

sort :: [(Integer, Integer)] -> [(Integer, Integer)]
sort [] = []
sort (x:xs) = sort [y | y <- xs, fst y > fst x || (fst y == fst x && snd y >= snd x)]
            ++ [x]
            ++ sort [y | y <- xs, fst y < fst x || (fst y == fst x && snd y < snd x)]

-- params:
--  the total amount of money (accumulator)
--  the current time
--  the list to be appended back
--  the sorted list
findTotal :: Integer -> Integer -> [(Integer, Integer)] -> [(Integer, Integer)] -> Integer
findTotal total (-1) _ _=            total
findTotal total currTime toAppend [] = findTotal total (currTime-1) [] (reverse toAppend) -- couldn't find a customer with a high enough time
findTotal total currTime toAppend (x:xs) | snd x >= currTime = findTotal (total+fst x) (currTime-1) [] (reverse toAppend++xs)
                                         | otherwise = findTotal total currTime (x:toAppend) xs

writeOutput :: (String -> String) -> String
writeOutput x = x "\n"
