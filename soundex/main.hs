module Main where

main :: IO ()
main = interact(writeOutput . solve . readInput)

readInput :: String -> [String]
readInput = lines

solve :: [String] -> ShowS
solve = foldl1 (.) . map (convert 0)

convert :: Int -> String -> ShowS
convert _ [] = ('\n':)
convert last (c:rest) | c `elem` "BFPV" = if last /= 1 then ('1':) . convert 1 rest else convert 1 rest
                 | c `elem` "CGJKQSXZ" = if last /= 2 then ('2':) . convert 2 rest else convert 2 rest
                 | c `elem` "DT" = if last /= 3 then ('3':) . convert 3 rest else convert 3 rest
                 | c == 'L' = if last /= 4 then ('4':) . convert 4 rest else convert 4 rest
                 | c `elem` "MN" = if last /= 5 then ('5':) . convert 5 rest else convert 5 rest
                 | c == 'R' = if last /= 6 then ('6':) . convert 6 rest else convert 6 rest
                 | otherwise = convert 0 rest

writeOutput :: ShowS -> String
writeOutput output = output ""
