main = getContents >>= print . sum . map (read :: String -> Int) . words . head . tail . lines
