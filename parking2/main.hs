main = do
    contents <- getContents
    let cases = tail $ lines contents
    mapM_ print $ carryOutCases cases

parsePosns :: String -> [Int]
parsePosns = map (read :: String -> Int) . words

maxMin :: [Int] -> (Int, Int)
maxMin = foldl (\(mx, mn) val -> (max mx val, min mn val)) (-1, 100)

carryOutCases :: [String] -> [Int]
carryOutCases [] = []
carryOutCases (_:line:rest) =
    let (mx, mn) = maxMin . parsePosns $ line
    in 2 * (mx - mn) : carryOutCases rest
