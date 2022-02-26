main = do
    line <- getLine
    mapM_ print $ smilePosns 0 line

smilePosns :: Int -> String -> [Int]
smilePosns _ []                 = []
smilePosns x (':':')':rest)     = x : smilePosns (x+2) rest
smilePosns x (';':')':rest)     = x : smilePosns (x+2) rest
smilePosns x (':':'-':')':rest) = x : smilePosns (x+3) rest
smilePosns x (';':'-':')':rest) = x : smilePosns (x+3) rest
smilePosns x (_:rest)           = smilePosns (x+1) rest
