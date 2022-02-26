main = do
    line <- getLine
    let num = read line :: Int
    print $ startBP num

buildPyramid :: Int -> Int -> Int -> Int
buildPyramid size n blocks | next > blocks = n
                           | otherwise = buildPyramid next (n+1) blocks
    where next = (2*n+1)^2 + size

startBP :: Int -> Int
startBP = buildPyramid 1 1
