main = do
    line <- getLine
    let numClauses = read $ head $ words line :: Int
    putStrLn $ (\x -> if x >= 8 then "satisfactory" else "unsatisfactory") numClauses
