main = do
    contents <- getContents
    print $ maxSpeed $ map parseCase $ tail . lines $ contents

parseCase :: String -> (Int, Int)
parseCase line =
    let parseList l = do
            (x, rest) <- reads l :: [(Int, String)]
            x : parseList rest
        caseList = parseList line in
    (head caseList, head $ tail caseList)

speed :: (Int, Int) -> (Int, Int) -> Int
speed (t1, d1) (t2, d2) = (d2 - d1) `div` (t2 - t1)

maxSpeed :: [(Int, Int)] -> Int
maxSpeed =
    let mapSpeedHelper :: Int -> [(Int, Int)] -> Int
        mapSpeedHelper currMax [] = currMax
        mapSpeedHelper currMax [_] = currMax
        mapSpeedHelper currMax (td1:td2:rest) =
            let s = speed td1 td2
            in if s > currMax then mapSpeedHelper s (td2:rest)
            else mapSpeedHelper currMax (td2:rest)
    in mapSpeedHelper 0
