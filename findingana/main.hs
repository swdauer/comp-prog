main = do
    word <- getLine
    putStrLn $ dropBeforeA word

dropBeforeA []         = []
dropBeforeA ('a':rest) = 'a':rest
dropBeforeA (r:rest)   = dropBeforeA rest
