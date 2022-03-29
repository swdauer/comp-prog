main = getContents >>= mapM_ putStrLn . reverse . tail . lines
