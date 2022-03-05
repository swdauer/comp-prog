main = getLine >> getLine >>= print . (*) (-1) . sumNegatives . map read . words

-- parseIntList :: String -> [Int]
-- parseIntList line = do
--     (x, rest) <- reads line
--     x : parseIntList rest

sumNegatives = sum . filter (< 0)
