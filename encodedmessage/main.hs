main =
    getContents >>= mapM_ (putStrLn .decode . parseCase) . tail . lines

intSqrt :: Int -> Int
intSqrt = round . sqrt . fromIntegral

formMatrix :: Int -> String -> [String]
formMatrix _ ""         = []
formMatrix rowSize rest = take rowSize rest : formMatrix rowSize (drop rowSize rest)

parseCase :: String -> [String]
parseCase line = formMatrix (intSqrt . length $ line) line

decode :: [String] -> String
decode ("":_) = ""
decode matrix = decode (map tail matrix) ++ map head matrix
