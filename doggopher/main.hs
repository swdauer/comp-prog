module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = lines

solve :: [String] -> ShowS
solve input = let (gopher:dog:holes) = parseInput True input
              in determineIfEscape gopher dog holes

parseInput :: Bool -> [String] -> [(Integer, Integer)]
parseInput _ [] = []
parseInput True (line:input) = let [xg, yg, xd, yd] = map (decimalToInteger id) (words line)
                               in (xg, yg):(xd, yd):parseInput False input
parseInput False (line:input) = let [x, y] = map (decimalToInteger id) (words line)
                                in (x, y):parseInput False input

decimalToInteger :: (String -> String) -> String -> Integer
decimalToInteger beginning ('.':rest) = 1000 * (read . beginning) "" + read rest
decimalToInteger beginning (x:rest)   = decimalToInteger (beginning . (x :)) rest

determineIfEscape :: (Integer, Integer) -> (Integer, Integer) -> [(Integer, Integer)] -> ShowS
determineIfEscape _ _ [] = ("The gopher cannot escape." ++)
determineIfEscape (xg, yg) (xd, yd) ((xh, yh):points) | 4 * ((xg - xh)^2 + (yg - yh)^2)
                                                        <= (xd - xh)^2 + (yd - yh)^2
                                                        = ("The gopher can escape through the hole at (" ++)
                                                          . showsCoordinate xh . (',':)
                                                          . showsCoordinate yh . (")." ++)
                                                      | otherwise = determineIfEscape (xg, yg) (xd, yd) points

showsCoordinate :: Integer -> ShowS
showsCoordinate x | length postDecimal == 1 = prefixShows . ('0':) . ('0':) . (postDecimal ++)
                  | length postDecimal == 2 = prefixShows . ('0':) . (postDecimal ++)
                  | otherwise = prefixShows . (postDecimal ++)
                  where postDecimal = show (mod x 1000)
                        prefixShows = shows (div x 1000) . ('.':)

writeOutput :: ShowS -> String
writeOutput s = s "\n"
