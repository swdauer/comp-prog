main = getLine >>= print . maxArea . map read . words

maxArea :: [Double] -> Double
maxArea xs =
    let s = sum xs / 2
    in sqrt . product . map (s -) $ xs
