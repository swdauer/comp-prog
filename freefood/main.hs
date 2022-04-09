main = do
    getLine
    contents <- getContents
    let intervals = map parseInterval $ lines contents
        -- combinedIntervals = foldl insertInterval [] intervals
        totalDays = foldl addListToDays [] $ map makeListOfDays intervals
    -- print intervals
    -- print totalDays
    print $ length totalDays

    -- print combinedIntervals
    -- print $ findNumDays combinedIntervals

-- I think the issue here has something to do with an interval could intersect with 2 intervals but would only be combined with the first
-- I'm going to change my method by instead keeping a list of all days
-- Then I'll find the length of that to get my output
-- insertInterval :: [(Int, Int)] -> (Int, Int) -> [(Int, Int)]
-- insertInterval [] i = [i]
-- insertInterval ((x, y):pts) (x', y')
--     | x > y'  = (x', y'):(x, y):pts
--     | x' > y = (x, y) : insertInterval pts (x', y')
--     | otherwise = (min x x', max y y') : pts

-- findNumDays :: [(Int, Int)] -> Int
-- findNumDays = foldl (\acc (x, y) -> acc + y - x + 1) 0

makeListOfDays :: (Int, Int) -> [Int]
makeListOfDays (x, y) = [x..y]

addListToDays :: [Int] -> [Int] -> [Int]
addListToDays [] days = days
addListToDays totalDays [] = totalDays
addListToDays (t:totalDays) (d:days) | t == d = t : addListToDays totalDays days
                                     | d < t = d : addListToDays (t:totalDays) days
                                     | otherwise = t : addListToDays totalDays (d:days)

parseInterval :: String -> (Int, Int)
parseInterval line =
    let (x:y:_) = map read $ words line
    in (x, y)
