main = do
    answer <- performCase
    if null answer
        then return ()
        else do
            putStrLn answer
            main

performCase :: IO String
performCase = do
    line <- getLine
    let doubles = map (read :: String -> Double) . words $ line
    if head doubles == 0
        then return ""
        else return $ shows (circleArea . head $ doubles) . (' ':) $ show (probableArea doubles)

circleArea :: Double -> Double
circleArea = (*pi) . (^2)

probableArea :: [Double] -> Double
probableArea (r:m:c:_) = (c / m) * ((2 * r)^2)
