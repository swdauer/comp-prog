type Date = (Int, Int, Int)

main = do
    getLine
    contents <- getContents
    mapM_ (putStrLn . outputForCase . parseCase . words) $ lines contents

parseDate :: String -> Date
parseDate dateString =
    let year = read $ take 4 dateString
        month = read $ take 2 $ drop 5 dateString
        day = read $ drop 8 dateString
    in (year, month, day)

parseCase :: [String] -> (String, Date, Date, Int)
parseCase (name:schoolDateString:dobString:coursesString:_) =
    (name, parseDate schoolDateString, parseDate dobString, read coursesString)

outputForCase :: (String, Date, Date, Int) -> String
outputForCase (name, (y1, m1, d1), (y2, m2, d2), courses)
    | y1 >= 2010 || y2 >= 1991 = name ++ " eligible"
    | courses >= 41 = name ++ " ineligible"
    | otherwise = name ++ " coach petitions"
