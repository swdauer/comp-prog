{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
main = print 3

doubleSignedArea (pt1:pts) = let doubleSignedAreaHelper pt1 [ptn] = determinant ptn pt1
                                 doubleSignedAreaHelper pt1 (pti:pti':pts) = determinant pti pti' + doubleSignedAreaHelper pt1 (pti':pts)
                             in doubleSignedAreaHelper pt1 (pt1:pts)

-- takes a doubleSignedArea output
areaString dsa | dsa < 0 = areaString $ dsa*(-1)
               | even dsa = shows (dsa `div` 2) ".0"
               | otherwise = shows (dsa `div` 2) ".5"

determinant (x1, y1) (x2, y2) = x1*y2 - x2*y1
