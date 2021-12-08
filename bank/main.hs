main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [(Integer, Integer)]
readInput = map (\x -> (twoElemListToPair . words) x) . lines

twoElemListToPair :: [String] -> (Integer, Integer)
twoElemListToPair [x,y] = (read x, read y)

solve :: [(Integer, Integer)] -> String
solve (x:xs) = let zs = sort xs
               in show (findBest 0 (snd x) 0 (pareDown 0 (-1) zs))

sort :: [(Integer, Integer)] -> [(Integer, Integer)]
sort [] = []
sort (x:xs) = sort [y | y <- xs, snd y < snd x || (snd y == snd x && fst y > fst x)]
            ++ [x]
            ++ sort [y | y <- xs, snd y > snd x || (snd y == snd x && fst y <= fst x)]

pareDown :: Integer -> Integer -> [(Integer, Integer)] -> [(Integer, Integer)]
pareDown _ _ [] = []
pareDown count elem (x:xs) | snd x == elem && count == elem + 1 = pareDown count elem xs
                           | snd x /= elem = x : pareDown 1 (snd x) xs
                           | otherwise = x : pareDown (count+1) elem xs

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
