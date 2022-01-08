{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

import           Control.Monad (replicateM)

main = do
    str <- getLine
    let n = read str :: Int
    if n == 0 then return ()
    else do
        a <- replicateM n getLine
        let dsa = doubleSignedArea . parseCase $ a
            outStr = if dsa >= 0 then "CCW " ++ areaString dsa
                     else "CW " ++ areaString ((-1)*dsa)
        putStrLn outStr
        main

-- CALCULATIONS
doubleSignedArea (pt1:pts) = let doubleSignedAreaHelper pt1 [ptn] = determinant ptn pt1
                                 doubleSignedAreaHelper pt1 (pti:pti':pts) = determinant pti pti' + doubleSignedAreaHelper pt1 (pti':pts)
                             in doubleSignedAreaHelper pt1 (pt1:pts)

-- takes a doubleSignedArea output
areaString dsa | even dsa = shows (dsa `div` 2) ".0"
               | otherwise = shows (dsa `div` 2) ".5"

determinant (x1, y1) (x2, y2) = x1*y2 - x2*y1

-- PARSING
parsePoint :: String -> (Int, Int)
parsePoint line = let [(x, rest)] = reads line
                      [(y, rest')] = reads rest
                  in (x, y)

parseCase :: [String] -> [(Int, Int)]
parseCase = map parsePoint
