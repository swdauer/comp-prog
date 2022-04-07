main = do
    getLine
    contents <- getContents
    let cases = map (map (read :: String -> Int) . words) $ lines contents
    mapM_ (putStrLn . testCase) cases

checkPredicate :: [Int] -> (Int -> Int -> Int -> Bool) -> Bool
checkPredicate [x, y, z] op = op x y z || op y x z

divPredicate :: Int -> Int -> Int -> Bool
divPredicate x y z = div x y == z && mod x y == 0

opPredicates = [divPredicate, \x y z -> x + y == z, \x y z -> x - y == z, \x y z -> x * y == z]

testCase :: [Int] -> String
testCase test = if any (checkPredicate test) opPredicates then "Possible" else "Impossible"
