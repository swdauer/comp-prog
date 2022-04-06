main = do
    getLine
    getLine
    getLine
    line <- getLine
    let split = map read $ words line
    print $ map (checkOp split) [(+), (-), (*), div]

checkOp :: [Int] -> (Int -> Int -> Int) -> Bool
checkOp [x,y,z] op = op x y == z || op y x == z
