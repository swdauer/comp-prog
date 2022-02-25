main = do
    contents <- getContents
    let ls = tail . lines $ contents
        cases = map (calculate . head . parseCase) ls
    mapM_ putStrLn cases

parseCase :: String -> [(Float, Float)]
parseCase line = do
    (b, rest) <- reads line :: [(Float, String)]
    (p, _) <- reads rest :: [(Float, String)]
    return (b, p)

calculate :: (Float, Float) -> String
calculate (b, p) =
    shows (60 * (b-1) / p) . (' ':)
    . shows (60 * b / p) . (' ':)
    . shows (60 * (b+1) / p)
    $ ""
