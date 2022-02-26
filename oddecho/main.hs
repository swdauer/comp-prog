import           GHC.IO.Handle (isEOF)
main = do
    a <- isEOF
    if a then return ()
    else do
        getLine
        b <- isEOF
        if b then return ()
        else do
            getLine >>= putStrLn
            main
