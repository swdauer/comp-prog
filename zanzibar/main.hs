main = do
    contents <- getContents
    let cases = map parseCase $ tail . lines $ contents
    mapM_ (print . findMinImports 0) cases

parseCase :: String -> [Int]
parseCase line = do
    (x, rest) <- reads line
    if x == 0 then []
    else x : parseCase rest

findMinImports :: Int -> [Int] -> Int
findMinImports acc [] = acc
findMinImports acc [_] = acc
findMinImports acc (prev:curr:turtles) =
    (if curr > 2 * prev then acc + curr - 2 * prev
    else acc) + findMinImports acc (curr:turtles)
