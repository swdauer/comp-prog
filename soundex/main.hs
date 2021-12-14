module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = lines

solve :: [String] -> ShowS
solve = foldl1 (.) . map convert

convert :: String -> ShowS
convert [] = ('\n':)
convert (c:rest) | c `elem` "BFPV" = ('1':) . convert rest
                 | c `elem` "CGJKQSXZ" = ('2':) . convert rest
                 | c `elem` "DT" = ('3':) . convert rest
                 | c == 'L' = ('4':) . convert rest
                 | c `elem` "MN" = ('5':) . convert rest
                 | c == 'R' = ('6':) . convert rest
                 | otherwise = convert rest

writeOutput :: ShowS -> String
writeOutput output = output ""
