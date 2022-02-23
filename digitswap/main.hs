main :: IO ()
main = do
    first <- getChar
    second <- getChar
    putChar second
    putChar first
    putChar '\n'
