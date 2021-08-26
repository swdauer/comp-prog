main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput s = lines s

solve :: [String] -> [String]
solve xs = playGames 0 11 xs

playGames :: Int -> Int -> [String] -> [String]
playGames 0 11 ("0":_) = [] 
playGames lower upper ("0":_) | lower >= upper - 1 = "Stan is dishonest" : []
                               | otherwise = "Stan may be honest" : []
playGames lower upper (x:"right on":xs) | (lower < upper - 1) && (xVal > lower) && (xVal < upper) = "Stan may be honest" : playGames 0 11 xs
                                        | otherwise = "Stan is dishonest" : playGames 0 11 xs
                                        where xVal = read x
playGames lower upper (x:"too high":xs) | xVal < upper = playGames lower xVal xs
                                        | otherwise = playGames lower upper xs
                                        where xVal = read x
playGames lower upper (x:"too low":xs) | xVal > lower = playGames xVal upper xs
                                       | otherwise = playGames lower upper xs
                                       where xVal = read x

writeOutput :: [String] -> String
writeOutput xs = unlines xs
