main = getLine >>= putStrLn . noDuplicates . words

noDuplicates :: [String] -> String
noDuplicates [] = "yes"
noDuplicates [_] = "yes"
noDuplicates (w:ws) =
    if w `elem` ws then "no"
    else noDuplicates ws
