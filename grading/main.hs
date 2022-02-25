import           Data.Char (chr, ord)
main = do
    line <- getLine
    gradeLine <- getLine
    let grade = read gradeLine :: Int
        gradingScale = parseGradingScale line
    putChar $ getGrade 'A' gradingScale grade
    putChar '\n'

parseGradingScale :: String -> [Int]
parseGradingScale line = do
    (a, as) <- reads line -- :: [(Int, String)]
    (b, bs) <- reads as
    (c, cs) <- reads bs
    (d, ds) <- reads cs
    (e, es) <- reads ds
    [a, b, c, d, e]

getGrade :: Char -> [Int] -> Int -> Char
getGrade c [] _ = c
getGrade c (l:ls) grade =
    if grade >= l
        then c
        else getGrade (chr $ ord c + 1) ls grade
