main = getLine >>= print . isP

isP :: String -> Int
isP ""         = 0
isP ('P':rest) = isE rest
isP (_:rest)   = 1 + isE rest

isE :: String -> Int
isE ""         = 0
isE ('E':rest) = isR rest
isE (_:rest)   = 1 + isR rest

isR :: String -> Int
isR ""         = 0
isR ('R':rest) = isP rest
isR (_:rest)   = 1 + isP rest
