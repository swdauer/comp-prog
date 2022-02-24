import           Control.Monad
main = do
    fstLine <- getLine
    let (numJudges, rest) = head . reads $ fstLine :: (Int, String)
        numRatings = fst . head . reads $ rest
    scoreStrs <- replicateM numRatings getLine
    let scoreSum = sum $ map (read :: String -> Float) scoreStrs
        lowAverage = (-3.0 * fromIntegral (numJudges - numRatings) + scoreSum) / fromIntegral numJudges
        highAverage = (3.0 * fromIntegral (numJudges - numRatings) + scoreSum) / fromIntegral numJudges
    putStrLn $ (shows lowAverage) . (' ':) . (shows highAverage) $ ""
