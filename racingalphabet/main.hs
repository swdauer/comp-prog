import           Data.Char
{-
Diameter of circle: 60 feet
28 sections: A-Z, SPACE, SINGLE-QUOTE
Players run at 15 feet per second
Each pickup takes 1 second
-}

main = do
    getLine
    -- line <- getLine
    -- print $ totalTime $ map letterToPosn line
    contents <- getContents
    mapM_ (print . totalTime . map letterToPosn) $ lines contents

letterToPosn :: Char -> Int
letterToPosn '\'' = 27
letterToPosn ' '  = 26
letterToPosn c    = ord c - ord 'A'

minDiff :: Int -> Int -> Int
minDiff x y | x > y = minDiff y x
            | otherwise = min (y-x) (28+x-y)

arcLength :: Double -> Double
arcLength n = (60 * pi / 28) * n

totalTime :: [Int] -> Double
totalTime []        = 0
totalTime [_]       = 1
totalTime (x:x':xs) = (arcLength . fromIntegral) (minDiff x x') / 15 + 1 + totalTime (x':xs)
