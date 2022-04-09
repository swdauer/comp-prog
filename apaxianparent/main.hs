main = getLine >>= putStrLn . combine . words

combine :: [String] -> String
combine (f:s:_) = addSuffix f ++ s

addSuffix :: String -> String
addSuffix []         = "ex"
addSuffix ['e']      = "ex"
addSuffix ['a']      = "ex"
addSuffix ['i']      = "ex"
addSuffix ['o']      = "ex"
addSuffix ['u']      = "ex"
addSuffix ['e', 'x'] = "ex"
addSuffix (x:xs)     = x : addSuffix xs
