main = getLine >>= print . canFit . map (read :: String -> Int) . words

canFit :: [Int] -> Int
canFit (wc:hc:ws:hs:_) =
    if wc >= ws + 2 && hc >= hs + 2 then 1
    else 0
