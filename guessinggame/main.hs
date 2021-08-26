main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput s = lines s

solve :: [String] -> [String]
solve xs = playGames 1 10 xs

playGames :: Int -> Int -> [String] -> [String]
playGames _ _ (x:[]) = [] 
playGames lower upper (x:"right on":xs) | lower > upper = "Stan is dishonest" : playGames 1 10 xs
                                        | otherwise = "Stan may be honest" : playGames 1 10 xs
playGames lower upper (x:"too high":xs) | xVal < upper = playGames lower xVal xs
                                        | otherwise = playGames lower upper xs
                                        where xVal = read x - 1
playGames lower upper (x:"too low":xs) | xVal > lower = playGames xVal upper xs
                                       | otherwise = playGames lower upper xs
                                       where xVal = read x + 1

writeOutput :: [String] -> String
writeOutput xs = unlines xs
