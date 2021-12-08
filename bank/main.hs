main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [(Integer, Integer)]
readInput = map (\x -> (twoElemListToPair . words) x) . lines

twoElemListToPair :: [String] -> (Integer, Integer)
twoElemListToPair [x,y] = (read x, read y)

solve :: [(Integer, Integer)] -> String
solve (x:xs) = let zs = sort xs
               in show (findBest 0 (snd x) 0 zs)

sort :: [(Integer, Integer)] -> [(Integer, Integer)]
sort [] = []
sort (x:xs) = sort [y | y <- xs, snd y < snd x || (snd y == snd x && fst y > fst x)]
            ++ [x]
            ++ sort [y | y <- xs, snd y > snd x || (snd y == snd x && fst y <= fst x)]

writeOutput :: String -> String
writeOutput x = x ++ "\n"

-- parameters:
--  current time
--  total time
--  total money accumulator
--  list of monies
--  total money
findBest :: Integer -> Integer -> Integer -> [(Integer, Integer)] -> Integer
findBest _ _ money [] = money
findBest curr time money (x:xs) | curr == time = money
                                | snd x < curr = findBest curr time money xs
                                | otherwise    = max (findBest (curr+1) time (money+fst x) xs) 
                                                     (findBest curr time money (shave (snd x) xs))

shave :: Integer -> [(Integer, Integer)] -> [(Integer, Integer)]
shave _ [] = []
shave i (x:xs) | snd x == i = shave i xs
               | otherwise  = x:xs
